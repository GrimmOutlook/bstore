hat = Product.create!(name: 'hat', price: 12.99, image_url: '/images/products/hat.jpg')
hoodie = Product.create!(name: 'hoodie', price: 24.99, image_url: '/images/products/hoodie.jpg')
iphone_case = Product.create!(name: 'iphone_case', price: 9.99, image_url: '/images/products/iphone_case.jpg')
journal = Product.create!(name: 'journal', price: 7.99, image_url: '/images/products/journal.jpg')
shirt = Product.create!(name: 'shirt', price: 17.99, image_url: '/images/products/shirt.jpg')
sticker = Product.create!(name: 'sticker', price: 3.99, image_url: '/images/products/sticker.jpg')


electronics = Category.create!(cat_name: 'electronics')
clothing = Category.create!(cat_name: 'clothing')
office_supplies = Category.create!(cat_name: 'office_supplies')

hat.categories << clothing
hoodie.categories << clothing
iphone_case.categories << electronics
iphone_case.categories << office_supplies
journal.categories << office_supplies
shirt.categories << clothing
sticker.categories << office_supplies

me = Customer.create!(name: 'Dave', email: 'd@g.com')

#me.credit_cards.create(cc_number: '1234123412341234', exp_month: '09', exp_year: '2016')

# puts "iphone_case categories: #{iphone_case.categories.map{ |c| c.cat_name }}"
# puts "iphone_case categories: #{iphone_case.categories.map(&:cat_name)}"

User.create!(email: 'mail@paulbarry.com', password: 'secret')





















# me = Customer.create(name: 'Paul Barry', email: 'mail@paulbarry.com')
# test = Customer.create(name: 'John Doe', email: 'test@example.com')
# Customer.create(name: 'Nowhere Man', email: 'man@nowhere.com')

# muffin = Product.create(name: 'Muffin', price: 2.99)
# smoothie = Product.create(name: 'Smoothie', price: 3.75)
# coffee = Product.create(name: 'Coffee', price: 3.99)

# order = Order.create(customer: me, placed_at: '2013-09-27')
# LineItem.create(order: order, quantity: 1, product: muffin)
# LineItem.create(order: order, quantity: 1, product: smoothie)

# order = Order.create(customer: me, placed_at: Time.current)
# LineItem.create(order: order, quantity: 1, product: smoothie)

# order = Order.create(customer: test, placed_at: Time.current)
# LineItem.create(order: order, quantity: 1, product: muffin)
# LineItem.create(order: order, quantity: 1, product: coffee)

