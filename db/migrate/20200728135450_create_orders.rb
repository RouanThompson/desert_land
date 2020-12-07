class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.datetime :number
      t.belongs_to :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
