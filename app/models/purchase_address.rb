class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_num, :city, :address, :purchase_id, :bulding_name, :phone_num, :prefecture_id, :token
  

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :city
    validates :address
    validates :post_num, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_num, format: { with: /\A\d{10,11}\z/ }, numericality: { only_integer: true }
    validates :token
  end

  validates :prefecture_id, numericality: { other_than: 1 } 


  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id,)
    Address.create(post_num: post_num, city: city, address: address, phone_num: phone_num, prefecture_id: prefecture_id, purchase_id: purchase.id)
  end
end