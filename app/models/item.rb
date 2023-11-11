class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  validates :name, presence: true
  validates :detail, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :image, presence: true

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id 
    validates :item_condition_id
    validates :delivery_condition_id
    validates :prefecture_id
    validates :reach_date_id
  end        

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :delivery_condition
  belongs_to :prefecture
  belongs_to :reach_date
end
