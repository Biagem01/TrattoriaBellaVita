class Ordine < ApplicationRecord
  belongs_to :cliente
  has_many :ordine_ricettum, dependent: :destroy, class_name: 'OrdineRicettum'
  has_many :ricette, through: :ordine_ricettum

  accepts_nested_attributes_for :ordine_ricettum, allow_destroy: true
  validates :cliente, presence: true
end
