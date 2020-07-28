class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :destroy
  has_many :items, through: :order_items
  validates :item_ids, presence: true
  
  def items_ids=(ids)
    ids.each do |id|
      self.items << Item.find(id)
    end
  end

end
