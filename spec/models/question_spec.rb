require "rails_helper"

RSpec.describe Question, type: :model do
  context "validations" do
    it "requires title" do
      question = Question.create(title: nil)
      expect(question.errors[:title].size).to eql(1)
    end

    it "requires description" do
      question = Question.create(description: nil)
      expect(question.errors[:description].size).to eql(1)
    end

    it "requires category" do
      question = Question.create(category_id: nil)
      expect(question.errors[:category].size).to eql(1)
    end

    it "requires user" do
      question = Question.create
      expect(question.errors[:user].size).to eql(1)
    end
  end
end
