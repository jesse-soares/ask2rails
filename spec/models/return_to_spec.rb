# -*- enconding: utf-8 -*-
require "./app/models/return_to"

RSpec.describe ReturnTo do
  it "returns default path when no chosen path has been given" do
    expect(ReturnTo.new("/default", nil).path).to eql("/default")
  end

  it "returns chosen path" do
    expect(ReturnTo.new("/default", "/chosen").path).to eql("/chosen")
  end

  it "returns default path for invalid chosen path" do
    expect(ReturnTo.new("/default", "ínválíd").path).to eql("/default")
  end

  it "returns with query string" do
    expect(ReturnTo.new("/default", "/chosen?a=1&b=2").path).to eql("/chosen?a=1&b=2")
  end
end