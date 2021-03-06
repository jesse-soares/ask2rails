class User < ApplicationRecord

  EMAIL_FORMAT = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  has_secure_password # create and validate fields :password, :password_confirmation and :password_digest

  has_many :questions
  has_many :answers

  validates_presence_of :name
  validates_format_of :email, :with => EMAIL_FORMAT
  validates_uniqueness_of :email

  scope :recent, lambda {|size = 20|
    limit(size).order("id DESC")
  }
end
