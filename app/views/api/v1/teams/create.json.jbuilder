json.team do
  json.id @team.id
  json.href api_v1_team_url(@team)
  json.nombre @team.nombre
  json.pais @team.pais
  json.user do
    json.id @team.user.id
    json.href api_v1_user_url(@team.user)
    json.email @team.user.email
  end
end
