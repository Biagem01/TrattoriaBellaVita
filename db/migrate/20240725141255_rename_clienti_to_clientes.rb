class RenameClientiToClientes < ActiveRecord::Migration[7.1]
  def change
    rename_table :clienti, :clientes
  end
end
