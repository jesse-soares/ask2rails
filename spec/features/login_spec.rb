# -*- enconding: utf-8 -*-
require "rails_helper"

RSpec.describe "Login" do
  
  context "with valid credentials" do
    before do
      @user = FactoryGirl.create(:user)

      visit "/"
      click_link t("menu.login")

      fill_in t("form.user.email"), :with => @user.email
      fill_in t("form.user.password"), :with => "test"
      click_button t("form.buttons.login")
    end

    it "redirects to the home page" do
      expect(current_path).to eql("/")
    end

    it "displays welcome message" do
      message = t("greeting.message", :name => @user.name)
      expect(page).to have_content(message)
    end

    it "hides login link" do
      expect(page).not_to have_content(t("menu.login"))
    end
  end

  context "with invalid credentials" do

    it "render login page"
    it "displays error message"
  end

  context "when already logged in" do
    it "redirects to the home page"
  end
end