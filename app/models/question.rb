class Question < ApplicationRecord
  attr_readonly :user_id    # update not allowed

  belongs_to :user
  belongs_to :category

  validates_presence_of :description
  validates_length_of :title, minimum: 10

  def viewed!
    increment!(:views_count)
  end
end
