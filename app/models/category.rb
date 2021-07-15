class Category 
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :description, type: String

  has_many :tasks
  validates :name, :description, presence: true
  validates_uniqueness_of :name
end
