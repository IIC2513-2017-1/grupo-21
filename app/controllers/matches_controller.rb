class MatchesController < ApplicationController
  include Secured

  before_action :set_match, only: [:show, :edit, :update, :destroy, :finalizar_partido]
  before_action :logged_in?, only: [:new, :edit, :update, :destroy, :create]
  before_action :is_current_user?, only: [:edit, :update, :destroy]
  before_action :is_finished?, only: [:finalizar_partido]

  # GET /matches
  # GET /matches.json
  def index
    @tournament = Tournament.find(params[:tournament_id])
    @matches_terminados = @tournament.matches.where(status_match: 'finalizado')
    @matches_fijados = @tournament.matches.where(status_match: 'fijado')
  end

  # GET /matches/1
  # GET /matches/1.json
  def show
  end



  # GET /matches/new
  def new
    @match = Match.new
    @tournament = Tournament.find(params[:tournament_id])
  end

  def update_finish_match
    @match = Match.find(params[:id])
    @tournament = Tournament.find(params[:tournament_id])
    respond_to do |format|
      if @match.update_attributes({ status_match: 'finalizado',
        goles_visita: params[:finish_match][:goles_visita],
        goles_local: params[:finish_match][:goles_local]})
        format.html {redirect_to tournament_match_path(@tournament, @match)}
      else
        format.html { render :finalizar_partido }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  def finalizar_partido

  end

  # GET /matches/1/edit
  def edit
  end

  # POST /matches
  # POST /matches.json
  def create
    @tournament = Tournament.find(params[:tournament_id])
    @match = @tournament.matches.new(match_params)
    respond_to do |format|

    if @match.save
        format.html { redirect_to tournament_matches_path(@tournament), notice: 'Match was successfully created.' }
        format.json { render :show, status: :created, location: @match }
      else
        format.html { render :new }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matches/1
  # PATCH/PUT /matches/1.json
  def update

    respond_to do |format|
      if @match.update(match_params)
        format.html { redirect_to tournament_matches_path(@tournament), notice: 'Match was successfully updated.' }
        format.json { render :show, status: :ok, location: @match }
      else
        format.html { render :edit }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matches/1
  # DELETE /matches/1.json
  def destroy
    @match.destroy
    respond_to do |format|
      format.html { redirect_to tournament_matches_path(@tournament), notice: 'Match was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match
      @match = Match.find(params[:id])
      @tournament = Tournament.find(params[:tournament_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def match_params
      params.require(:match).permit(:fecha, :tournament_id, :equipo_local_id, :equipo_visita_id)
            .merge(status_match: "fijado")
    end

    def is_current_user?
      redirect_to(root_path, notice: 'Acceso Prohibido!') unless @match.tournament.user == current_user
    end

    def is_finished?
      redirect_to(tournament_matches_path(@tournament), notice: 'Este partido ya terminó!') unless @match.status_match == 'fijado'
    end
end
