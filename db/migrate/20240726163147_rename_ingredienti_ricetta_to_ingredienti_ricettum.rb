class RenameIngredientiRicettaToIngredientiRicettum < ActiveRecord::Migration[6.0]
  def change
    rename_table :ingredienti_ricetta, :ingredienti_ricettum
  end
end