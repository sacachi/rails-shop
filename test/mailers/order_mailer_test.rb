require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  test 'user_mail' do
    mail = OrderMailer.user_mail
    assert_equal 'User mail', mail.subject
    assert_equal ['to@example.org'], mail.to
    assert_equal ['from@example.com'], mail.from
    assert_match 'Hi', mail.body.encoded
  end

  test 'shop_mail' do
    mail = OrderMailer.shop_mail
    assert_equal 'Shop mail', mail.subject
    assert_equal ['to@example.org'], mail.to
    assert_equal ['from@example.com'], mail.from
    assert_match 'Hi', mail.body.encoded
  end
end
