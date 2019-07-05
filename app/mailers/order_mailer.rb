class OrderMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.user_mail.subject
  #
  def user_mail(order_id)
    @order = Order.find(order_id)

    mail to: @order.user.email, subject: 'Congratulation for your successful order'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.shop_mail.subject
  #
  def shop_mail(order_id)
    @order = Order.find(order_id)
    product_id = @order.product_ids[0]
    @shop_account = Product.find(product_id).shop_account

    mail to: @shop_account.email, subject: 'You have a new order'
  end
end
