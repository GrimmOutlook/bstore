class Product < ActiveRecord::Base
  has_many :line_items
  has_many :orders, :through => :line_items
  has_many :categorizations
  has_many :categories, :through => :categorizations

  validates :name, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end