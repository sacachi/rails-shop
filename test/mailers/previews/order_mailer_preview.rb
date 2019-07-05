# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/order_mailer/user_mail
  def user_mail
    OrderMailer.user_mail
  end

  # Preview this email at http://localhost:3000/rails/mailers/order_mailer/shop_mail
  def shop_mail
    OrderMailer.shop_mail
  end
end
