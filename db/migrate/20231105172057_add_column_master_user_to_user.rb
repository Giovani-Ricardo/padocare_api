class AddColumnMasterUserToUser < ActiveRecord::Migration[7.1]
  def change
    add_reference :users, :master_user
  end
end
