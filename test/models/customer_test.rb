require 'test_helper'

class CustomerTest < ActiveSupport::TestCase

  def test_save_customers
    customer = Customer.new(name: 'anythingyouwant', email: 'anyemail')
    assert customer.save,
      customer.errors.full_messages.join(', ')
  end

  def test_email_unique(email: "anyemail")
    if
      email = Customer.new(email: 'anyemail')
      # Customer.create(email: 'anyemail')
      assert email(customer) != email
    else
      email.errors.full_messages.join(', ')
    end
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
