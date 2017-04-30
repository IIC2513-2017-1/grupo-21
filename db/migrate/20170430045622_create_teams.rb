class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :nombre
      t.string :pais

      t.timestamps
    end
  end
end
