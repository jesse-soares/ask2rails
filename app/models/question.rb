class Question < ApplicationRecord
  attr_readonly :user_id                      # update not allowed

  belongs_to :user, counter_cache: true       # update `users.questions_count`
  belongs_to :category, counter_cache: true   # update `categories.questions_count`

  has_many :answers, -> { includes :user }    # eager load `answers.user`

  validates_presence_of :description
  validates_length_of :title, minimum: 10

  scope :sort_by_newest, lambda { order("id DESC") }

  def viewed!
    increment!(:views_count)
  end
end
