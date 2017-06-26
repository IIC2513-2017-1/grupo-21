class TournamentsController < ApplicationController
  include Secured

  before_action :set_tournament, only: [:show, :edit, :update, :destroy, :terminar_torneo]
  before_action :logged_in?, only: [:new, :edit, :update, :destroy, :create]
  helper_method :dict_tipo
  before_action :is_current_user?, only: [:edit, :update, :destroy]
  before_action :partidos_generados?, only: [:generar_partidos]
  before_action :torneo_terminado?, only: [:generar_partidos, :edit, :terminar_torneo, :destroy]


  # GET /tournaments
  # GET /tournaments.json
  def index
    @tournaments = Tournament.all
  end

  # def pdf
  #     send_file Rails.root.join('private', @tournament.pdf_file_name), :type=>"application/pdf", :x_sendfile=>true
  # end

  def dict_tipo
      @dict_tipo = {1 => "Liga", 2 => "Play-Off", 3 => "Liga + Play-Off"}
  end

  def generar_partidos
    @tournament = Tournament.find(params[:id])
    @tournament.generar_partidos
    @tournament.update_attributes({ partidos_generados: true})
  end

  def terminar_torneo
    @tournament.update_attributes({ estado: 'terminado'})
    redirect_to @tournament, notice: 'Torneo finalizado correctamente'
  end

  # GET /tournaments/1
  # GET /tournaments/1.json
  def show
    partidos = @tournament.matches.where(status_match: 'finalizado')
    @equipos = []
    partidos.each do |partido|
      @equipos << partido.equipo_local
      @equipos << partido.equipo_visita
    end
    Rails.logger.debug("Partidooooos: #{partidos.inspect}")
    Rails.logger.debug("Clase: #{partidos.class.inspect}")
    @equipos.uniq! {|equipo| equipo[:id] }
    @tabla = {}
    @equipos.each do |team|
      puntos = 0
      goles_favor = 0
      goles_contra = 0
      partidos_jugados = 0
      partidos_ganados = 0
      partidos_perdidos = 0
      partidos_empatados = 0
      Rails.logger.debug("Partidos jugados: #{partidos_jugados.inspect}")
      partidos.each do |match|
        if match.equipo_local == team
          if match.goles_local > match.goles_visita
            partidos_ganados += 1
            goles_favor += match.goles_local
            goles_contra += match.goles_visita
            puntos += 3
          elsif match.goles_local < match.goles_visita
            partidos_perdidos += 1
            goles_favor += match.goles_local
            goles_contra += match.goles_visita
          else
            partidos_empatados += 1
            goles_favor += match.goles_local
            goles_contra += match.goles_visita
            puntos += 1
          end
          partidos_jugados += 1
        elsif match.equipo_visita == team
          if match.goles_local < match.goles_visita
            partidos_ganados += 1
            goles_favor += match.goles_visita
            goles_contra += match.goles_local
            puntos += 3
          elsif match.goles_local > match.goles_visita
            partidos_perdidos += 1
            goles_favor += match.goles_visita
            goles_contra += match.goles_local
          else
            partidos_empatados += 1
            goles_favor += match.goles_visita
            goles_contra += match.goles_local
            puntos += 1
          end
          partidos_jugados += 1
        end

      end

      @tabla[team.id] = {puntos: puntos, partidos_empatados: partidos_empatados,
                        partidos_perdidos: partidos_perdidos, partidos_ganados: partidos_ganados,
                      goles_favor: goles_favor, goles_contra: goles_contra,
                      partidos_jugados: partidos_jugados}
      @tabla = Hash[ @tabla.sort_by { |key, val| [val[:puntos], val[:goles_favor]-val[:goles_contra], val[:goles_favor]] }.reverse ]
     Rails.logger.debug("My object: #{@tabla.inspect}")
     @ganador = @tournament.teams.find_by_id(@tabla.max_by{|k,v| v[:puntos]}[0]).nombre

    end
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: @tournament.pdf_file_name   # Excluding ".pdf" extension.
      end
    end

  end

  # GET /tournaments/new
  def new
    @tournament = Tournament.new
  end

  # GET /tournaments/1/edit
  def edit
  end

  # POST /tournaments
  # POST /tournaments.json
  def create
    @tournament = Tournament.new(tournament_params)
    respond_to do |format|
      if @tournament.save
        UserMailer.tournament_email(@tournament.user, @tournament).deliver_later
        format.html { redirect_to @tournament, notice: 'Tournament was successfully created.' }
        format.json { render :show, status: :created, location: @tournament }
      else
        format.html { render :new }
        format.json { render json: @tournament.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tournaments/1
  # PATCH/PUT /tournaments/1.json
  def update
    respond_to do |format|
      if @tournament.update(tournament_params)
        format.html { redirect_to @tournament, notice: 'Tournament was successfully updated.' }
        format.json { render :show, status: :ok, location: @tournament }
      else
        format.html { render :edit }
        format.json { render json: @tournament.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tournaments/1
  # DELETE /tournaments/1.json
  def destroy
    @tournament.destroy
    respond_to do |format|
      format.html { redirect_to tournaments_url, notice: 'Tournament was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tournament
      @tournament = Tournament.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tournament_params
      params.require(:tournament).permit(:nombre, :tipo, :pdf, team_ids:[])
            .merge(user_id: current_user.id)
    end

    def is_current_user?
      redirect_to(root_path, notice: 'Acceso Prohibido!') unless @tournament.user == current_user
    end

    def partidos_generados?
      @tournament = Tournament.find(params[:id])
      redirect_to(@tournament, notice: 'Ya generaste los partidos para el torneo!') unless !@tournament.partidos_generados
    end

    def torneo_terminado?
      @tournament = Tournament.find(params[:id])
      redirect_to(@tournament, notice: 'Este torneo ya terminó!') unless !(@tournament.estado == 'terminado')
    end
end
