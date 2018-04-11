class CreateConfigs < ActiveRecord::Migration
  def change
    create_table :configs do |t|
      t.integer :contribuyente_id
      t.integer :establecimiento_id
      t.integer :mes
      t.integer :year
      t.references :usuario, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
