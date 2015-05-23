class Track < ActiveRecord::Base
  belongs_to :user
  validates :name, uniqueness: { scope: :user_id },
                     presence: true,
                     length: {maximum: 30},
                     format: {with: /\A[a-zA-Z0-9\s]+\z/ }
end
