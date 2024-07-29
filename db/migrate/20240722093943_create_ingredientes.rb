class CreateIngredientes < ActiveRecord::Migration[7.1]
  def change
    create_table :ingredienti do |t|
      t.string :nome
      t.string :quantita
      t.string :giacenza

      t.timestamps
    end
  end
end
