class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :name, presence: true, on: :update

  validates :email, presence: true, uniqueness: true,
             email_format: { message: 'has invalid format' }

  validates :password, confirmation: true, length: { minimum: 3 }
  attr_accessor :password, :password_confirmation
  def admin?
    name == 'Marian'
  end
end
