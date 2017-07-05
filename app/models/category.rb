class Category < ApplicationRecord
  has_many :questions

  scope :sorted_by_name, lambda { order("name") }
end
