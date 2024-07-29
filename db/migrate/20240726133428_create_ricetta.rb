class CreateRicetta < ActiveRecord::Migration[7.1]
  def change
    create_table :ricetta do |t|
      t.string :nome

      t.timestamps
    end
  end
end
