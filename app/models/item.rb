class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping
  belongs_to_active_hash :shipping_day
  belongs_to_active_hash :prefecture

  with_options　numericality: { other_than: 1 }　do
    validates :category_id,     
    validates :status_id,       
    validates :shipping_id,     
    validates :shipping_day_id, }
    validates :prefecture_id,
  end   

end
