class Task 
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :description, type: String
  field :due_date, type: Date
  field :code, type: String

  belongs_to :category
  belongs_to :owner, class_name: 'User'
  has_many :participating_users, class_name: 'Participant'
  #has_many :participants, through: :participating_users, source: :user

  has_many :notes

  validates :name, :due_date, :description, presence: true
  validate :due_date_validity

  accepts_nested_attributes_for :participating_users, allow_destroy: true

  def participants
    participating_users.includes(:user).map(&:user)
  end

  def due_date_validity
    return if due_date.blank?
    return if due_date > Date.today
    errors.add :due_date, "fecha invalida"
  end

  def create_code
    self.code = "#{owner_id}#{Time.now.to_i.to_s(36)}#{SecureRandowm.hex(8)}"
  end

end
