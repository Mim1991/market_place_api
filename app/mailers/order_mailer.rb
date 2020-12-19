class OrderMailer < ApplicationMailer
  default from: 'no-reply@marketplace.com'

  def send_confirmation(order)
    @order = order
    @user = @order.user
    mail to: @user.email, subject: 'Order Confirmation'
  end

  #def send_confirmation
  #  @greeting = "Hi"

   # mail to: "to@example.org"
  #end
end
