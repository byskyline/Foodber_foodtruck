class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|

    	t.string :food_truck_id
      t.string :name
      t.string :phone
      t.float  :longitude
      t.float  :latitude
      t.integer :amount
      t.string :status
      t.string :payment_status

      t.timestamps null: false
    end
  end
end
