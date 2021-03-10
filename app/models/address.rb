class Address < ApplicationRecord
  belongs_to :purchase

  with_options presence: true do
    validates :city
    validates :address
  end

  validates :post_num, presence: true, format: { /\A\d{3}[-]\d{4}\z/ }

  validates :phone_num, numericality: { only_integer: true, less_than: 11}
  
  validates :prefecture_id, numericality: { other_than: 1 } 

end
