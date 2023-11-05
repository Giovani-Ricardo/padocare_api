class User < ApplicationRecord
    # Indica que essa tabela irá ter uma senha criptografada
    has_secure_password

    # Define os relacionamentos da tabela
    has_one :smartlock, dependent: :nullify
    has_many :managed_users, class_name: 'User', foreign_key: :master_user_id , dependent: :destroy
    # belongs_to :master_user, class_name: 'User'

    # Define as validações necessárias para a tabela
    validates :name, :email, :password, presence: :true
    validates :email, uniqueness: :true
end
