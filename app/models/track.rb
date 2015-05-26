class Track < ActiveRecord::Base
  belongs_to :user
  has_many :goals, dependent: :destroy
  validates :name, uniqueness: { scope: :user_id },
                     presence: true,
                     length: {maximum: 30}
end
