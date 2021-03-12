class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string      :post_num,          null: false
      t.string      :city,              null: false
      t.string      :address,           null: false
      t.string      :building_name      
      t.string      :phone_num,         null: false
      t.integer     :prefecture_id,     null: false
      t.references  :purchase,          foreign_key: true
      t.timestamps
    end
  end
end
