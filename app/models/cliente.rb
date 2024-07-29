class Cliente < ApplicationRecord

  has_many :ordini

  
  validates :nome, presence: true
  validates :email, presence: true, uniqueness: { message: "è già in uso" }
  validates :telefono, presence: true
  validates :indirizzo, presence: true
end