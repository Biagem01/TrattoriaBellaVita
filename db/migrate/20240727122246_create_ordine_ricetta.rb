class CreateOrdineRicetta < ActiveRecord::Migration[7.1]
  def change
    create_table :ordine_ricetta do |t|
      t.references :ordine, null: false, foreign_key: true
      t.references :ricetta, null: false, foreign_key: true
      t.integer :quantita, null: false

      t.timestamps
    end
  end
end
