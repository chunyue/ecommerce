class UserMailer < ApplicationMailer
  default from: "My Cart <info@alphacamp.co>"

  def notify_order_create(order)
    @order = order
    @content = "Your order is created. Thank you!"

    mail to: order.user.email,
    subject: "ALPHA Camp | 訂單成立: #{@order.id}"
  end

  def notify_order_shipped(order)
    @order = order
    @content = "Your order is shipped!"

    mail to: order.user.email,
    subject: "ALPHA CAMP | #{@order.id} 包裹寄出"
  end

end
