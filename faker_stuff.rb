Customer.delete_all
100.times do
  customer = Customer.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email)


    customer.credit_cards.create!(
      card_number: Faker::Business.credit_card_number)
end
