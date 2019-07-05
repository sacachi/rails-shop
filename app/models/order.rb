class Order < ApplicationRecord
  belongs_to :user, foreign_key: :customer_id
  has_many :order_products, foreign_key: :order_id
  has_many :products, through: :order_products
end
