FactoryBot.define do
  factory :order_address do
    token          {"hoge"}
    user_id        {1}
    item_id        {1}
    postal_number  {"123-4567"}
    prefecture_id  {1}
    city           {"大阪市"}
    house_number   {"1-2-3"}
    build_name     {"大阪ビル"}
    phone_number   {"01234567890"}
  end
end