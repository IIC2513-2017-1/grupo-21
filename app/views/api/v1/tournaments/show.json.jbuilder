json.tournament do
  json.id @tournament.id
  json.href api_v1_tournament_url(@tournament)
  json.nombre @tournament.nombre
  json.tipo @tournament.tipo
  json.user do
    json.id tournament.user.id
    json.href api_v1_user_url(tournament.user)
    json.email tournament.user.email
  end
end
