class CreateTournaments < ActiveRecord::Migration[5.0]
  def change
    create_table :tournaments do |t|
      t.string :nombre, :null => false
      t.integer :tipo, :null => false 

      t.timestamps
    end
  end
end
