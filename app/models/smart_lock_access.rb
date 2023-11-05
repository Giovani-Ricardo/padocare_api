class SmartLockAccess < ApplicationRecord
  belongs_to :user
  belongs_to :smartlock

  validates :user_id, :smartlock_id, presence: true

  Types = [{id: 1, description: 'Abrir'}, {id: 2, description: 'Fechar'} ]

  def access_type
    Types.select{|t| t[:id] == type_id}
  end
end
