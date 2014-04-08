require 'test_helper'

class CustomerTest < ActiveSupport::TestCase

  def test_save_success
    customer = Customer.new(name: 'Test', email: 'test@example.com')
    assert customer.save,
      customer.errors.full_messages.join(', ')
  end

  def test_save_no_name
    customer = Customer.new(email: 'test@example.com')
    refute customer.save
    assert_equal ["can't be blank"],
      customer.errors[:name]
  end

  def test_save_no_email
    customer = Customer.new(name: 'Test')
    refute customer.save
    assert_equal ["can't be blank"],
      customer.errors[:email]
  end

  def test_save_email_already_taken
    Customer.create(name: 'Test', email: 'test@example.com')
    customer = Customer.new(name: 'Test', email: 'test@example.com')
    refute customer.save
    assert_equal ["has already been taken"],
      customer.errors[:email]
  end




# def unit_price(line_item)
#   line_item[:total] / line_item[:quantity]
# end

# def test_unit_price(expected, line_item)
#   if unit_price(line_item) == expected
#     puts "OK"
#   else
#     raise "FAIL"
#   end
# end

# test_unit_price(2.25, quantity: 3, total: 6.75)





end
