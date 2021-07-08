class Category < ApplicationRecord
  has_many :tasks
  validates :name, :description, presence: true
end
