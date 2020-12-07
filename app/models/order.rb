class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :destroy
  has_many :items, through: :order_items

  # add validation
  validates :item_ids, presence: true
  
  # define setter items_ids= to create association for Items selected in New Order Form
  def items_ids=(ids)
    ids.each do |id|
      self.items << Item.find(id)
    end
  end

  # method to calculate total price
  def total_price
    prices = self.items.map {|item| item.price}
    prices.reduce(0) {|sum,x| sum + x }
  end

end
