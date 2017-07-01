require "rails_helper"

RSpec.describe "Logout", type: :feature do
  
  context "when logged in" do
    before do
      user = FactoryGirl.create(:user)
      login_as(user)

      visit root_path
      click_link t("menu.logout")
    end

    it "redirects to the login page" do
      expect(current_path).to eql(login_path)
    end
  end

  context "when unlogged" do
    before do
      visit logout_path
    end

    it "redirects to the login page" do
      expect(current_path).to eql(login_path)
    end
  end
end