# -*- enconding: utf-8 -*-
require "./app/models/return_to"

RSpec.describe ReturnTo do
  it "returns default path when no chosen path has been given" do
    path = ReturnTo.new("/default", nil).path
    expect(path).to eql("/default")
  end

  it "returns chosen path" do
    path = ReturnTo.new("/default", "/chosen").path
    expect(path).to eql("/chosen")
  end

  it "returns default path for invalid chosen path" do
    path = ReturnTo.new("/default", "ínválíd").path
    expect(path).to eql("/default")
  end

  it "returns with query string" do
    path = ReturnTo.new("/default", "/chosen?a=1&b=2").path
    expect(path).to eql("/chosen?a=1&b=2")
  end

  it "ignores host" do
    path = ReturnTo.new("/default", "http://example.org/chosen").path
    expect(path).to eql("/chosen")
  end
end