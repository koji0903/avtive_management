class Item < ActiveRecord::Base
  belongs_to :unit
  belongs_to :updated_person
  has_many :categorizations
  has_many :item_categories, through: :categorizations
  
  validates :name,
    uniqueness: {
      message: "同一商品が既に存在します。",
      scope: [:name]
    }

  validates :number, numericality: { only_integer: false, greater_than_or_equal_to: 0 }
end
