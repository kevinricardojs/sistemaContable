class CreateEstablecimientos < ActiveRecord::Migration
  def change
    create_table :establecimientos do |t|
      t.string :nombre
      t.string :telefono
      t.string :colonia
      t.string :departamento
      t.string :municipio
      t.string :zona
      t.string :calle
      t.string :numero_casa
      t.references :contribuyente, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
