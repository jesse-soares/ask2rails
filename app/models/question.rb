class Question < ApplicationRecord
  attr_readonly :user_id    # update not allowed

  belongs_to :user
  belongs_to :category

  validates_presence_of :title, :description
end
