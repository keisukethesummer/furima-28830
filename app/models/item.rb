class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  with_options presence: true do
    validates :user_id
    validates :name
    validates :image
    validates :description
    validates :price, format: { with: /\A[0-9]+\z/}, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
    validates :seller_prefecture_id, numericality: { other_than: 0}
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :delivery_fee_id
      validates :shipment_day_id
    end
  end
  belongs_to_active_hash :category, :condition, :delivery, :seller, :shipment_day
end
