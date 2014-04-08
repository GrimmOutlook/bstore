require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  def test_save_success
    category = Category.new(cat_name: 'test')
    assert category.save,
      category.errors.full_messages.join(', ')
  end

  def test_save_failure
    category = Category.new
    refute category.save
    assert_equal ["can't be blank"],
      category.errors[:cat_name]
  end

end
