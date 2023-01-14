class Food < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  validates :name, presence: true
  validates :meeasurment_unit, presence: true
  validates :price, presence: true
  validates :quantity, presence: true

  has_many :recipe_foods, dependent: :destroy
end
