# frozen_string_literal: true

require "rails_helper"

RSpec.describe "mentees/show", type: :view do
  before(:each) do
    assign(:mentee, Mentee.create!(
      name: "Name",
      bio: "MyText",
      email: "test@test.com"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Email/)
  end
end
