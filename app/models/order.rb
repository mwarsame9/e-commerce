class Order < ApplicationRecord
  validates :status, :presence => true
  validates :total_price, :presence => true
  has_many :order_items
end
