class SmartLockAccess < ApplicationRecord
  belongs_to :user
  belongs_to :smartlock

  validates :user_id, :smartlock_id, presence: true
  validates :type_id, numericality: {greater_than: 0, only_integer: true, less_than_or_equal_to: 2}

  Types = [{id: 1, description: 'Abrir'}, {id: 2, description: 'Fechar'} ]

  # retorna o tipo de acesso que o usuário realizou, (Abrir ou fechar)
  def access_type
    Types.select{|t| t[:id] == type_id}
  end
end
