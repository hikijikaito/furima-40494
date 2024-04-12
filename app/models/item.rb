class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one :order

  has_one_attached :image

  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :shipping_duration

  validates :name, :description, :price, :image, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :category_id, :condition_id, :shipping_cost_id, :prefecture_id, :shipping_duration_id, presence: true
  validates :category_id, :condition_id, :shipping_cost_id, :prefecture_id, :shipping_duration_id, numericality: { other_than: 0 }
end
