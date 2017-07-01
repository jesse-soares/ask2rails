module FeatureHelper
  def login_as(user)
    visit root_path
    click_link t("menu.login")

    fill_in t("form.user.email"), :with => user.email
    fill_in t("form.user.password"), :with => "test"
    click_button t("form.buttons.login")
  end
end

RSpec.configure do |config|
  config.include FeatureHelper, :type => :feature
end