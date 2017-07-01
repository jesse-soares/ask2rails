require "rails_helper"

RSpec.describe Authentication, type: :model do

  context "with valid credentials" do
    before do
      @user = FactoryGirl.create(:user)
    end

    it "returns users" do
      authenticated_user = Authentication.authenticate(@user.email, "test")
      expect(authenticated_user).to eql(@user)
    end
  end

  context "with invalid email" do
    before do
      @user = FactoryGirl.create(:user)
    end

    it "returns no user" do
      authenticated_user = Authentication.authenticate("invalid", "test")
      expect(authenticated_user).not_to be
    end
  end

  context "with invalid password" do
    before do
      @user = FactoryGirl.create(:user)
    end

    it "returns no user" do
      authenticated_user = Authentication.authenticate(@user.email, "invalid")
      expect(authenticated_user).not_to be
    end
  end
end