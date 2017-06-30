class User < ApplicationRecord

  EMAIL_FORMAT = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  has_secure_password

  validates_presence_of :name
  validates_format_of :email, :with => EMAIL_FORMAT
  validates_uniqueness_of :email
end
