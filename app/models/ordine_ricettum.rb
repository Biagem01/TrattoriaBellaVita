class OrdineRicettum < ApplicationRecord
  self.table_name = 'ordine_ricetta'
  belongs_to :ordine
  belongs_to :ricetta

  validates :ordine, presence: true
  validates :ricetta, presence: true
  validates :quantita, presence: true, numericality: { greater_than: 0 }
end
