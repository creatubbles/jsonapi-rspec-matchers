require "spec_helper"

RSpec.describe Jsonapi::Rspec::Matchers do
  it "has a version number" do
    expect(Jsonapi::Rspec::Matchers::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
