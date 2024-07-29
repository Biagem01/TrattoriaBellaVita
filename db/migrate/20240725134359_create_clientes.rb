class CreateClientes < ActiveRecord::Migration[7.1]
  def change
    create_table :clienti do |t|
      t.string :nome
      t.string :email
      t.string :telefono
      t.text :indirizzo

      t.timestamps
    end
  end
end
