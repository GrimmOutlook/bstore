Customer.delete_all
CreditCard.delete_all
LineItem.delete_all
Order.delete_all

product_ids = Product.pluck(:id)

100.times do
  customer = Customer.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email)

  customer.credit_cards.create!(
     cc_number: Faker::Business.credit_card_number)
  #puts "created credit card #{cc_number}"

  (rand(5) + 1).times do |n|
    order = customer.orders.create!#(placed_at: DateTime::now)
      puts "created #{n} orders"
      pids = product_ids.dup

    (rand(5) + 1).times do
      order.line_items.create!(product_id: pids.shuffle!.pop,
        quantity: rand(5) + 1)

    # sum = 0
    # order.line_items.each do |li|
    #   sum += li.price * li.quantity
    # end

    end
    # order.calculate_total_amount
    # order.save!


    #Why don't we save in this script??
    #line_item.increment_total_amount.save!
  end

end





  # products = Product.create!(product_id: rand((5)+1))

  # customer.line_items = LineItem.create!( quantity: rand((4)+1),
  #   # product_id: product.sample
  #   price: products.price.sample
  #   # quantity: rand((4)+1)
  #    )

  # customer.orders = Order.create!( quantity: rand((4)+1))

