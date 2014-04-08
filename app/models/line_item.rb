class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  before_save :set_price
  after_save :increment_order_total_amount

  validates :order_id, :product_id, presence: true
  validates :quantity, presence: true, numericality: { greater_than: 0, allow_blank: true }


  def set_price
    self.price = product.price
  end

  def total_price
    price * quantity
  end

  #This method passes total_price as a number to the order model
  def increment_order_total_amount
    order.increment_total_amount(total_price)
    # order.total_amount ||= 0
    # order.total_amount += total_price
    # order.save
  end
end
