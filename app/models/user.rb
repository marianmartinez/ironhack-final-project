class User < ActiveRecord::Base
  has_many :tracks, dependent: :destroy

  authenticates_with_sorcery!

  mount_uploader :picture, PictureUploader

  validates :name, presence: true, on: :update
  validates :email, presence: true, uniqueness: true,
             email_format: { message: 'has invalid format' }
  validates :password, confirmation: true, length: { minimum: 3 }
  validate  :picture_size

  attr_accessor :password, :password_confirmation

  def admin?
    email == 'marian.mtnz@gmail.com'
  end

  def self.admin
    find_by email: 'marian.mtnz@gmail.com'
  end

  private

  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
end
