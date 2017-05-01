class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :nombre, :null => false
      t.string :apellido, :null => false
      t.string :pais, :null => false 
      t.integer :edad
      t.integer :dorsal
      t.integer :goles
      t.integer :asistencias

      t.timestamps
    end
  end
end
