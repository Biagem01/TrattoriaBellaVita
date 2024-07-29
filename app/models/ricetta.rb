class Ricetta < ApplicationRecord
  has_many :ordine_ricettum, class_name: 'OrdineRicettum'
  has_many :ordini, through: :ordine_ricettum

  has_many :ingredienti_ricettum, dependent: :destroy
  has_many :ingredienti, through: :ingredienti_ricettum
  accepts_nested_attributes_for :ingredienti_ricettum, allow_destroy: true
end
