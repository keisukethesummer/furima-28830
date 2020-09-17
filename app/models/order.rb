class Order < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :seller_prefecture
  belongs_to :user
  belongs_to :item
  has_one :address
end
