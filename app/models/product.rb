class Product < ApplicationRecord
  belongs_to :shop_account
  validates :name, presence: true
  validates :desc, presence: true
  validates :price, presence: true
  mount_uploader :images, PictureUploader
  has_many :category_products, dependent: :destroy
  has_many :categories, through: :category_products
  has_many :order_products
  has_many :orders, through: :order_products
  accepts_nested_attributes_for :category_products
end
