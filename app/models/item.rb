class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping
  belongs_to :shipping_day
  belongs_to :prefecture

  with_options numericality: { other_than:1} do
    validates :category_id     
    validates :status_id       
    validates :shipping_id     
    validates :shipping_day_id 
    validates :prefecture_id
  end   

end
