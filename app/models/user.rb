class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :name, presence: true, on: :update

  validates :email, presence: true, uniqueness: true

  # look for gem:validates_email_format_of :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

  validates :password, confirmation: true, length: { minimum: 3 }
  attr_accessor :password, :password_confirmation
end
