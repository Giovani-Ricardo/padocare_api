class User < ApplicationRecord
    has_secure_password
    has_one :smartlock, dependent: :nullify
    # belongs_to :master_user, class_name: 'User'
    has_many :managed_users, class_name: 'User', foreign_key: :master_user_id , dependent: :destroy

    validates :name, :email, :password, presence: :true
    validates :email, uniqueness: :true
end
