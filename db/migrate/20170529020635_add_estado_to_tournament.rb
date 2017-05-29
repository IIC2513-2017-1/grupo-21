class AddEstadoToTournament < ActiveRecord::Migration[5.0]
  def change
    add_column :tournaments, :estado, :string
  end
end
