require 'test_helper'

class ManageAdminProductsTest < ActionDispatch::IntegrationTest

  def test_manage_admin_products
    visit "/admin/products"
    click_on "Create New Product"
    fill_in "Enter the name of the new product:"
    fill_in "Enter its price:"
    fill_in "Add the url for the photo of the product:"
    # Verify the "product was created" flash message appears
    click_on
    click_on
    fill_in
    # Verify the price of the product was updated.
    # Verify the "product was updated" flash message appears
    click_on
    click_on
    # Verify the product no longer appears in the product list
  end

end

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
