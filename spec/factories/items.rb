FactoryBot.define do
  factory :item do
    item_name             { '商品名' }
    description           { '商品説明' }
    category_id           { 2 }
    status_id             { 2 }
    shipping_id           { 2 }
    shipping_day_id       { 2 }
    prefecture_id         { 2 }
    price                 { 1000 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/ダイス1.png'), filename: 'ダイス1.png')
    end
  end
end
