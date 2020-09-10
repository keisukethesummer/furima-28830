FactoryBot.define do
  factory :item do
    user_id           {1}
    name              { '商品' }
    description       { '2010年頃に購入したジャケットです' }
    price             { '1000' }
    category          { Category.find 2 }
    condition         { Condition.find 2 }
    delivery_fee      { DeliveryFee.find 2 }
    seller_prefecture { SellerPrefecture.find 2 }
    shipment_day      { ShipmentDay.find 2 }
  end
end
