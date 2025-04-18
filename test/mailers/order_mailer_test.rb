require "test_helper"

class OrderMailerTest < ActionMailer::TestCase
  setup do
    @order = orders(:one)
  end

  test "should bet set to be delivered to the user from order passed in" do
    mail = OrderMailer.send_confirmation(@order)

    assert_equal "Order confirmation", mail.subject
    assert_equal [@order.user.email], mail.to
    assert_equal ["no-reply@marketplace.com"], mail.from
    assert_match "Order: ##{@order.id}", mail.body.encoded
    assert_match "You ordered #{@order.products.count} products", mail.body.encoded
  end
end
