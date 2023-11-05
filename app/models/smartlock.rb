class Smartlock < ApplicationRecord
  # Define as relações da tabela
  belongs_to :user
  has_many :smart_lock_accesses, dependent: :destroy
  
  # Validações para os atributos da tabela
  validates :serial, :manufacturing_date, presence: true
  validates :serial, uniqueness: true

end
