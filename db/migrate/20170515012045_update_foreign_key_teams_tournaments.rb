class UpdateForeignKeyTeamsTournaments < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :teams_tournaments, :teams
    remove_foreign_key :teams_tournaments, :tournaments

    # add the new foreign_key
    add_foreign_key :teams_tournaments, :teams, on_delete: :cascade
    add_foreign_key :teams_tournaments, :tournaments, on_delete: :cascade
  end
end
