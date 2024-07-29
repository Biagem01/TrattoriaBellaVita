class AddQuantitaToOrdineRicetta < ActiveRecord::Migration[7.1]
  def change
    add_column :ordine_ricetta, :quantita, :integer
  end
end
