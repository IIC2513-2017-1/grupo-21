json.user do
  json.id @user.id
  json.href api_v1_user_url(@user)
  json.email @user.email
  json.teams do
    json.array! @user.teams do |team|
      json.id team.id
      json.href api_v1_team_url(team)
      json.nombre team.nombre
      json.pais team.pais
    end
  end
  json.tournaments do
    json.array! @user.tournaments do |tournament|
      json.id tournament.id
      json.href api_v1_tournament_url(tournament)
      json.nombre tournament.nombre
      json.tipo tournament.tipo
      json.array! tournament.teams do |team|
        json.id team.id
        json.href api_v1_team_url(team)
        json.nombre team.nombre
        json.pais team.pais
      end
    end
  end
end
