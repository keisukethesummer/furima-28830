class OrderAddress

  include ActiveModel::ActiveModel
  attr_accessor :user_id, :name, :price, :item_id

  validates :token, presence: true

  with_options presense: true do
    validates :postal_number, format: {with: /\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :city
    validates :house_number
    validates :phone_number, length: {maximum: 11 }
  end

  def save
    user = User.find(params[:id])
    item = Item.find(params[:id])
    Order.create(user_id: user.id, item_id: item.id)
    Address.create(postal_number: postal_number, prefecture: prefecture, city: city, house_number: house_number, phone_number: phone_nuber)
  end
end