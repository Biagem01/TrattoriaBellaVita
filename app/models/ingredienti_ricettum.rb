class IngredientiRicettum < ApplicationRecord
  self.table_name = 'ingredienti_ricetta'
  belongs_to :ricetta
  belongs_to :ingrediente

  validates :quantita, presence: true
end