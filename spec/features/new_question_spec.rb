require "rails_helper"

RSpec.describe "New question", type: :feature do
  context "with valid data" do
    before do
      user = FactoryGirl.create(:user)
      category = FactoryGirl.create(:category)

      login_as user
      visit root_path
      click_link t("menu.new_question")

      fill_in t("form.question.title"), with: "TITLE WITH AT LEAST 10 CHARACTERS"
      fill_in t("form.question.description"), with: "DESCRIPTION"
      select category.name, from: t("form.question.category")
      click_button t("helpers.submit.question.create")
    end

    it "redirects to the question" do
      expect(current_path).to eql(question_path(Question.last))
    end

    it "displays success message" do
      expect(page).to have_content(t("flash.questions.create.notice"))
    end
  end

  context "with invalid data" do
    before do
      user = FactoryGirl.create(:user)
      
      login_as user
      visit root_path
      click_link t("menu.new_question")

      click_button t("helpers.submit.question.create")
    end

    it "renders question form" do 
      expect(current_path).to eql(new_question_path)
    end

    it "displays error message" do
      expect(page).to have_content(t("form.error_message"))
    end
  end

  context "when unlogged" do
    before do
      visit root_path
      click_link t("menu.new_question")
    end

    it "redirect to login page" do
      expect(current_path).to eql(login_path)
    end

    it "displays error message" do
      expect(page).to have_content(t("login.you_must_be_logged_in"))
    end
  end
end