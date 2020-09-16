class OrderAddress

  include ActiveModel::Model
  attr_accessor :token, :user_id, :name, :price, :item_id, :postal_number, :prefecture_id, :city, :build_name, :house_number, :phone_number

  with_options presence: true do
    validates :token
    validates :postal_number, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :city
    validates :house_number
    validates :phone_number, length: {maximum: 11 }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(order_id: order.id, postal_number: postal_number, prefecture_id: prefecture_id, city: city, build_name: build_name, house_number: house_number, phone_number: phone_number)
  end
end