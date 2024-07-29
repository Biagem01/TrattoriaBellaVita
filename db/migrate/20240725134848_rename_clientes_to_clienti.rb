class RenameClientesToClienti < ActiveRecord::Migration[7.1]
  def change
    rename_table :clientes, :clienti
  end
end
