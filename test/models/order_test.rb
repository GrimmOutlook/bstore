require 'test_helper'

class OrderTest < ActiveSupport::TestCase

  def test_create
    order = Order.new
    assert order.save
  end

  # def test_first
  #   assert_equal 9.99, Order.first.total_amount
  # end

  def test_total_revenue

    assert_equal 30.00, Order.total_revenue

  end

  # test "the truth" do
  #   assert true
  # end
end
