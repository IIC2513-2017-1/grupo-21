class CreateTournaments < ActiveRecord::Migration[5.0]
  def change
    create_table :tournaments do |t|
      t.string :nombre
      t.integer :tipo

      t.timestamps
    end
  end
end
