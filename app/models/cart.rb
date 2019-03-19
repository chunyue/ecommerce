class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items

  def add_cart_item(product)
    existing_item = self.cart_items.find_by( product_id: product)
    if existing_item
      existing_item.quantity += 1
      existing_item.save!
    else
      cart_item = cart_items.build( product_id: product.id )
      cart_item.save!
    end  
    self.cart_items
  end

  def add_cart_item_quantity(product)
    existing_item = self.cart_items.find_by( product_id: product)
    existing_item.quantity += 1
    existing_item.save!
     self.cart_items
  end

  def sub_cart_item_quantity(product)
    existing_item = self.cart_items.find_by( product_id: product)
    if existing_item.quantity == 1
       existing_item.destroy
    else  
      existing_item.quantity -= 1
      existing_item.save!
    end
    self.cart_items
    
  end

end
