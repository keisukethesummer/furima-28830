FactoryBot.define do
  factory :item do
    name              {"商品"}
    description       {"2010年頃に購入したジャケットです"}
    price             {"1000"}
    category          {Category.find 1}
    condition         {Condition.all.sample}
    delivery_fee      {DeliveryFee.all.sample}
    seller_prefecture {SellerPrefecture.all.sample}
    shipment_day      {ShipmentDay.all.sample}
  end
end
