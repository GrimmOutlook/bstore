class Product < ActiveRecord::Base
  has_many :line_items
  has_many :orders, :through => :line_items
  has_many :categorizations
  has_many :categories, :through => :categorizations

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0, allow_blank: true }

  def self.search(search)
      where('name ILIKE ?', "%#{search}%")
  end


  #For pg_search gem: pg_search_scope :search, :against => :name
  scope :min_price, -> (price) { where('price >= ?', price) }
  scope :max_price, -> (price) { where('price <= ?', price) }

  # def self.max_price(price)
  #     where('name ILIKE ?' <= "%#{price}%")
  # end

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
