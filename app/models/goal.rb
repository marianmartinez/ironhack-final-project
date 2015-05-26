class Goal < ActiveRecord::Base
  belongs_to :track
  has_many :sources, dependent: :destroy
  validates :name, presence: true,
                   length: {maximum: 30}
  validates :description, presence: true,
                   length: {maximum: 250}
  validates :goal_date, presence: true
  validates :accomplished, inclusion: { in: [true, false] }
end
