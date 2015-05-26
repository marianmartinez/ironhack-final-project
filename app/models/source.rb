class Source < ActiveRecord::Base
  belongs_to :track
  validates :name, presence: true,
                   length: {maximum: 30}
  validates :url, presence: true
  validates :image, presence: true
  validates :kind, presence: true,
                   length: {maximum: 30}
end
