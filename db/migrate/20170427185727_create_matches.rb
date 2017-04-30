class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.datetime :fecha
      t.integer :goles_local
      t.integer :goles_visita
      t.boolean :penales
      t.integer :penales_local
      t.integer :penales_visita

      t.timestamps
    end
  end
end
