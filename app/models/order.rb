class Order < ActiveRecord::Base
  belongs_to :customer
  belongs_to :order
  has_many :line_items
  has_many :products, :through => :line_items

  validates :customer_id, :credit_card_id, presence: true
  validate :credit_card_belongs_to_customer

  def credit_card_belongs_to_customer
    if customer_id && credit_card_id
      unless customer_id == credit_card.customer_id
        errors.add(:credit_card_id, "does not belongs to this customer")
      end
    end
  end

  # def calculate_total_amount
  #   # self.total_amount = line_items.inject(0){ |sum, li|
  #   #   sum + li.total_price
  #   # }
  # end

  def increment_total_amount(amount)
    update(total_amount: (total_amount || 0) + amount)
    # self.total_amount ||= 0
    # self.total_amount += total_price
    # save - no need to save, just update b/c can't have a line item w/o an order
  end

  def self.total_revenue
    connection.select_value("SELECT sum(total_amount) From orders").to_f
    # sum(:total_amount)
  end

  def self.total_customer
    # connection.select_all("SELECT customer_id, sum(total_amount)
    #  FROM orders
    #  GROUP BY customer_id")
    group(:customer_id).sum(:total_amount)
  end

end
