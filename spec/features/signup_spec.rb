require "rails_helper"

RSpec.describe "Signup", type: :feature do

  context "with valid data" do

    before do
      visit root_path
      click_link t("menu.signup")

      fill_in t("form.user.name"), :with => "John Doe"
      fill_in t("form.user.email"), :with => "john@example.org"
      fill_in t("form.user.password"), :with => "test"
      fill_in t("form.user.password_confirmation"), :with => "test"
      click_button t("helpers.submit.user.create")
    end
    
    it "redirect to the login page" do
      expect(current_path).to eql(login_path)
    end

    it "displays success message" do
      expect(page).to have_content(t("flash.users.create.notice"))
    end
  end

  context "with invalid data" do

    before do
      visit root_path
      click_link t("menu.signup")

      click_button t("helpers.submit.user.create")
    end

    it "displays signup form" do
      expect(current_path).to eql(signup_path)
    end

    it "displays error message" do
      expect(page).to have_content(t("form.error_message"))
    end
  end

  context "when already logged in" do

    before do
      @user = FactoryGirl.create(:user)
      login_as(@user)
      visit signup_path
    end

    it "redirects to the home page" do
      expect(current_path).to eql(root_path)
    end
  end
  
end