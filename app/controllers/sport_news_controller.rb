class SportNewsController < ApplicationController
  def index
    response = HTTParty.get('https://newsapi.org/v1/articles?source=bbc-sport&sortBy=top&apiKey=31346aff77ad4f7586ce05ca74b1e5f5')
    # 31346aff77ad4f7586ce05ca74b1e5f5
    articulos = JSON.parse(response.body)
    @articulos = articulos["articles"]
  end
end
