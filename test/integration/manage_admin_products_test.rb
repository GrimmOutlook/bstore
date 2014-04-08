require 'test_helper'

class ManageAdminProductsTest < ActionDispatch::IntegrationTest

  #Paul's Solution:
  def test_manage
    visit "/admin/products"

    click_on "New Product"
    fill_in "Name", with: "Awesome"
    fill_in "Price", with: "9.99"
    click_on "Save"

    assert page.has_content?(/Product.*was created/)
    click_on "Awesome"
    assert page.has_content?('9.99')
    click_on "Edit"

    fill_in "Price", with: "18.99"
    click_on "Save"

    click_on "Awesome"
    assert page.has_content?('18.99')
    click_on "Delete"

    refute page.has_content?('Awesome')
  end


  # My Solution:
  # def test_manage_admin_products
  #   visit "/admin/products"
  #   click_on "Create New Product"
  #   fill_in "Enter the name of the new product:", with: 'donkey'
  #   fill_in "Enter its price:", with: '200.00'
  #   fill_in "Add the url for the photo of the product:", with: '/assets/images/logo.jpg'
  #   click_on "Create Product"
  #   save_and_open_page
  #   assert page.has_content?('Product donkey was created')


  #   click_on product.id
  #   click_on "Edit Product Information"
  #   fill_in "Enter its price:", with: '321100.00'
  #   assert page.has_content?('321100.00')
  #   assert page.has_content?('Product #{@product.price} was updated')
  #   click_on "Delete"
  #   assert page.has_content?('Product #{@product.id} was deleted')
  # end

end

# Assignment:
# Go to /admin/products
# Click on new product
# Fill in the form with basic product information
# Verify the "product was created" flash message appears
# Click on the link to that new product
# Click on the link to edit that product
# Fill in the form to change the price of the product.
# Verify the price of the product was updated.
# Verify the "product was updated" flash message appears
# Click on the product again
# Click on the link to delete the product.
# Verify the product no longer appears in the product list
