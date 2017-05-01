class MatchesController < ApplicationController
  before_action :set_match, only: [:show, :edit, :update, :destroy]

  # GET /matches
  # GET /matches.json
  def index
    @matches = Match.all
  end

  # GET /matches/1
  # GET /matches/1.json
  def show
  end

  # GET /matches/new
  def new
    @match = Match.new
  end

  # GET /matches/1/edit
  def edit
  end

  # POST /matches
  # POST /matches.json
  def create
    @match = Match.new(match_params)
    ids = Tournament.find_by_id(@match.tournament_id).team_ids
    respond_to do |format|
      if @match.equipo_visita_id == @match.equipo_local_id
        format.html { redirect_to new_match_path, notice: 'El equipo local no puede ser el mismo que el equipo visita.' }
      elsif !(ids.include? @match.equipo_visita_id and ids.include? @match.equipo_local_id)
        format.html { redirect_to new_match_path, notice: 'Ambos equipos deben estar inscritos en el campeonato' }
      elsif @match.save
        format.html { redirect_to @match, notice: 'Match was successfully created.' }
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
    ids = Tournament.find_by_id(@match.tournament_id).team_ids
    new_params = match_params
    respond_to do |format|
      if new_params[:equipo_visita_id] == new_params[:equipo_local_id]
        format.html { redirect_to edit_match_path(@match), notice: 'El equipo local no puede ser el mismo que el equipo visita.' }
      elsif !(ids.include? new_params[:equipo_local_id]and ids.include? new_params[:equipo_visita_id])
        format.html { redirect_to edit_match_path(@match), notice: 'Ambos equipos deben estar inscritos en el campeonato' }
      elsif @match.update(match_params)
        format.html { redirect_to @match, notice: 'Match was successfully updated.' }
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
      format.html { redirect_to matches_url, notice: 'Match was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match
      @match = Match.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def match_params
      params.require(:match).permit(:fecha, :tournament_id, :equipo_local_id, :equipo_visita_id)
    end
end
