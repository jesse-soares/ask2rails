require "rails_helper"

RSpec.describe User, type: :model do
  
  context "validations" do
  
    it "requires name" do
      user = User.create(:name => nil)
      expect(user.errors[:name].size).to eq(1)
    end

    it "requires email" do
      user = User.create(:email => nil)
      expect(user.errors[:email].size).to eq(1)
    end

    it "requires unique email" do
      existing = User.create!({
          :name => "John Doe",
          :email => "john@example.org",
          :password => "test",
          :password_confirmation => "test"
        })

      user = User.create(:email => existing.email)
      expect(user.errors[:email].size).to eq(1)
    end

    it "requires valid email" do
      user = User.create(:email => "invalid")
      expect(user.errors[:email].size).to eq(1)
    end

    it "accepts valid email" do
      user = User.create(:email => "john.doe@example.org")
      expect(user.errors[:email].size).to eq(0)
    end

    it "requires password" do
      user = User.create(:password => nil)
      expect(user.errors[:password].size).to eq(1)
    end

    it "requires password confirmation" do
      user = User.create({
        :password => "test",
        :password_confirmation => "invalid"
      })
      expect(user.errors[:password_confirmation].size).to eq(1)
    end
  end
end
