require "spec_helper"

describe "Start page", type: :feature do
  before do
    visit "/"
  end

  it "links to tutorial" do
    expect(page).to have_selector(:link_or_button, "tutorial")
  end

  it "links to support contacts" do
    expect(page).to have_selector(:link_or_button, "technical support")
  end
end
