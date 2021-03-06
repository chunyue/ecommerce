class Order < ApplicationRecord
  validates_presence_of :name, :address, :payment_status, :shipping_status

  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items
  has_many :payments

  PAYMENT_STATUS = [
    ["Not Paid", :not_paid],
    ["Paid", :paid]
  ]

  SHIPPING_STATUS =[
    ["Not Shipping", :not_shipped],
    ["Shipping", :shipped]
  ]

  def add_order_items(cart)
    cart.cart_items.each do |item|
      self.order_items.build(
        product_id: item.product.id,
        quantity: item.quantity,
        price: item.product.price
        )
    end
  end

  def subtotal
    order_items.map{ |x| x.item_total }.sum
  end
end
