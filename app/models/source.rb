class Source < ActiveRecord::Base
  belongs_to :track
  validates :name, presence: true,
                   length: {maximum: 30},
                   format: {with: /\A[a-zA-Z0-9\s]+\z/ }
  validates :url, presence: true
  validates :image, presence: true
  validates :kind, presence: true,
                   length: {maximum: 30},
                   format: {with: /\A[a-zA-Z0-9\s]+\z/ }
end
