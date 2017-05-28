class AddMatchesGeneratedToTournament < ActiveRecord::Migration[5.0]
  def change
    add_column :tournaments, :partidos_generados, :boolean
  end
end
