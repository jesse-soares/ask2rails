require "rails_helper"

RSpec.describe "Logout", type: :feature do
  
  context "when logged in" do
    before do
      user = FactoryGirl.create(:user)
      login_as(user)

      visit "/"
      click_link t("menu.logout")
    end

    it "redirects to the login page" do
      expect(current_path).to eql("/login")
    end
  end

  context "when unlogged" do
    before do
      visit "/logout"
    end

    it "redirects to the login page" do
      expect(current_path).to eql("/login")
    end
  end
end