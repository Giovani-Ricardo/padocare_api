class CreateSmartLockAccesses < ActiveRecord::Migration[7.1]
  def change
    create_table :smart_lock_accesses do |t|
      t.references :user, foreign_key: true
      t.references :smartlock, foreign_key: true
      t.integer :type_id

      t.timestamps
    end
  end
end
