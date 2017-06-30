class User < ApplicationRecord
  
  EMAIL_FORMAT = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  validates_presence_of :name, :password
  validates_format_of :email, :with => EMAIL_FORMAT
  validates_confirmation_of :password
  validates_uniqueness_of :email
end
