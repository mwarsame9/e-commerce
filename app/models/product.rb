class Product < ApplicationRecord
  validates :name, :presence => true
  validates :price, :presence => true
  has_many :order_items
  has_many :reviews
end
