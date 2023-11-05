class Smartlock < ApplicationRecord
  belongs_to :user
  has_many :smart_lock_accesses, dependent: :destroy
  validates :serial, :manufacturing_date, presence: true
  validates :serial, uniqueness: true

end
