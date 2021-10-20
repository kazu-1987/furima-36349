class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_day

  with_options presence: true do
    validates :image
    validates :item_name
    validates :description
    validates :price
  end

  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
  validates :price, numericality: { only_integer: true, message: 'Half-width number.' }
  validates :condition_id, numericality: { other_than: 1, message: 'Select' }
  validates :delivery_fee_id, numericality: { other_than: 1, message: 'Select' }
  validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
  validates :delivery_day_id, numericality: { other_than: 1, message: 'Select' }
  validates :category_id, numericality: { other_than: 1, message: 'Select' }
end
