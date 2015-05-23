class Goal < ActiveRecord::Base
  belongs_to :track
  has_many :sources dependent: :destroy
  validates :name, presence: true,
                   length: {maximum: 30},
                   format: {with: /\A[a-zA-Z0-9\s]+\z/ }
  validates :description, presence: true,
                   length: {maximum: 250},
                   format: {with: /\A[a-zA-Z0-9\s]+\z/ }
  vallidates :goal_date, presence: true
  validates :accomplished, presence: true, numericality: true
end
