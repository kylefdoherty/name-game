require 'rails_helper'

RSpec.describe "teammates/show", :type => :view do
  before(:each) do
    @teammate = assign(:teammate, Teammate.create!(
      :image => "Image",
      :name => "Name",
      :team => "Team",
      :title => "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Image/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Team/)
    expect(rendered).to match(/Title/)
  end
end
