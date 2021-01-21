class CreateDeliveryFrees < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_frees do |t|
      t.integer :delivery_free_name , null: false
      t.timestamps
    end
  end
end
