class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :nombre, :null => false
      t.string :pais, :null => false 

      t.timestamps
    end
  end
end
