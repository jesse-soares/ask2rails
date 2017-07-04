class Answer < ApplicationRecord
  attr_readonly :question_id, :user_id

  belongs_to :question, counter_cache: true   # update `question.answers_count` automatically
  belongs_to :user

  validates_presence_of :question, :user, :content

  scope :recent, lambda {|size = 10| limit(size).order("id DESC") }
end
