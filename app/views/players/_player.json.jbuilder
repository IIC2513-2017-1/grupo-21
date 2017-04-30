json.extract! player, :id, :nombre, :apellido, :nacionalidad, :edad, :dorsal, :goles, :asistencias, :created_at, :updated_at
json.url player_url(player, format: :json)
