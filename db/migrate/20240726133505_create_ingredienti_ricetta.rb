class CreateIngredientiRicetta < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredienti_ricette do |t|
      t.references :ricetta, null: false, foreign_key: true
      t.references :ingrediente, null: false, foreign_key: { to_table: :ingredienti }
      t.decimal :quantita

      t.timestamps
    end
  end
end