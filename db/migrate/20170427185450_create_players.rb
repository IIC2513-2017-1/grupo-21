class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :nombre
      t.string :apellido
      t.string :nacionalidad
      t.integer :edad
      t.integer :dorsal
      t.integer :goles
      t.integer :asistencias

      t.timestamps
    end
  end
end
