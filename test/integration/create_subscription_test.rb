require 'test_helper'

class CreateSubscriptionTest < ActionDispatch::IntegrationTest

  # def test_create_subscription
  #   get "/"
  #   assert_response :success
  # end

  # def test_create_subscription
  #   visit "/"
  #   assert page.has_content?("Find out when we go live")
  # end

  def test_create_subscription
    visit "/"
    fill_in "Find out when we go live", with: 'test@example.com'
    click_on "Click to sign up!!"
    save_and_open_page
    assert page.has_content?('Subscription was successfully created.')
    assert_equal 'test@example.com', Subscription.last.email
  end

end
