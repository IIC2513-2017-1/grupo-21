module Api::V1
  class TournamentsController < ApiController
    before_action :authenticate

    def index
      @tournaments = Tournament.all
    end

    def show
      @tournament = Tournament.find(params[:id])
    end

  end
end
