class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy

  def add_cart_item(product)
    existing_item = self.cart_items.find_by( product: product)
    if existing_item
      exiting_item.quantity += 1
      exiting_item.save!
    else
      cart_item = cart_items.build( product: product )
      cart_item.save!
    end  
    self.cart_items
  end
end
