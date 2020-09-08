class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :category, :condition, :delivery, :seller, :shipment_day
  has_one_attached :image
  with_options presence: true do
    validates :user_id
    validates :name
    validates :image
    validates :description
    validates :price
    validates :seller_prefecture, numericality: { other_than: 0}
    with_options numericality: { other_than: 1 } do
          validates :category_id
          validates :condition_id
          validates :delivery_fee_id          
          validates :shipment_day
    end
  end
end
