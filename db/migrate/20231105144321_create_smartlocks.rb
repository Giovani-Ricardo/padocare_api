class CreateSmartlocks < ActiveRecord::Migration[7.1]
  def change
    create_table :smartlocks do |t|
      t.string :serial
      t.references :user, foreign_key: true
      t.datetime :manufacturing_date

    end
  end
end
