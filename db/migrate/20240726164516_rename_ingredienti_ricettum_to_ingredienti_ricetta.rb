class RenameIngredientiRicettumToIngredientiRicetta < ActiveRecord::Migration[6.0]
  def change
    rename_table :ingredienti_ricettum, :ingredienti_ricetta
  end
end
