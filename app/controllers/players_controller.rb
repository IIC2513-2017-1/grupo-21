class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  # GET /players
  # GET /players.json
  def index
    @team = Team.find(params[:team_id])
    @players = @team.players
  end

  # GET /players/1
  # GET /players/1.json
  def show
    @team = Team.find(params[:team_id])
  end

  # GET /players/new
  def new
    @team = Team.find(params[:team_id])
    @player = Player.new
  end

  # GET /players/1/edit
  def edit
    @team = Team.find(params[:team_id])
  end

  # POST /players
  # POST /players.json
  def create
    @team = Team.find(params[:team_id])
    @player = @team.players.new(player_params)

    respond_to do |format|
      if @player.save
        format.html { redirect_to team_players_path(@team), notice: 'Player was successfully created.' }
        format.json { render :show, status: :created, location: @player }
      else
        format.html { render :new }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /players/1
  # PATCH/PUT /players/1.json
  def update
    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to team_players_path(@team), notice: 'Player was successfully updated.' }
        format.json { render :show, status: :ok, location: @player }
      else
        format.html { render :edit }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    @player.destroy
    respond_to do |format|
      format.html { redirect_to tournament_matches_path(@tournament), notice: 'Player was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
      @team = Team.find(params[:team_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_params
      params.require(:player).permit(:nombre, :apellido, :pais, :edad, :dorsal, :goles, :asistencias, :team_id)
    end
end
