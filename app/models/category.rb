class Category < ApplicationRecord
  belongs_to :user
  has_many :user_transactions
  
  validates :name, presence: true
  validates :icon, presence: true
end
