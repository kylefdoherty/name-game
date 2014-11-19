require 'rails_helper'

RSpec.describe "teammates/index", :type => :view do
  before(:each) do
    assign(:teammates, [
      Teammate.create!(
        :image => "Image",
        :name => "Name",
        :team => "Team",
        :title => "Title"
      ),
      Teammate.create!(
        :image => "Image",
        :name => "Name",
        :team => "Team",
        :title => "Title"
      )
    ])
  end

  it "renders a list of teammates" do
    render
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Team".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
