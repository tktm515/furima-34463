FactoryBot.define do
  factory :purchase_address do
    post_num              {"123-4567"}
    prefecture_id         { 2 }
    city                  {"大阪市"}
    address               {"123-44"}
    bulding_name          {"青ビル"}
    phone_num             {"09012345678"}
    token {"tok_abcdefghijk00000000000000000"}
    
  end
end
