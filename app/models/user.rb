class User < ApplicationRecord
  validates :name, presence: true
  has_many :categories, foreign_key: 'user_id'
  has_many :user_transactions, foreign_key: :author_id
end
