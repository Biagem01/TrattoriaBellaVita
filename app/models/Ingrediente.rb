class Ingrediente < ApplicationRecord
    validates :nome, :quantita, :giacenza, presence: true
    self.table_name = 'ingredienti'  # Questa riga è opzionale e serve solo se il nome della tabella non segue la convenzione

    has_many :ingredienti_ricette
    has_many :ricette, through: :ingredienti_ricette
  end