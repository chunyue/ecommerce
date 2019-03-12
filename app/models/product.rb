class Product < ApplicationRecord
  mount_uploader :image, PhotoUploader
  has_many :cart_items, dependent: :destroy
  has_many :carts, through: :cart_items
end
