class Answer < ApplicationRecord
  belongs_to :question, counter_cache: true   # update `question.answers_count` automatically
  belongs_to :user
end
