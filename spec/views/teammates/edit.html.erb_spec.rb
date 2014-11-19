require 'rails_helper'

RSpec.describe "teammates/edit", :type => :view do
  before(:each) do
    @teammate = assign(:teammate, Teammate.create!(
      :image => "MyString",
      :name => "MyString",
      :team => "MyString",
      :title => "MyString"
    ))
  end

  it "renders the edit teammate form" do
    render

    assert_select "form[action=?][method=?]", teammate_path(@teammate), "post" do

      assert_select "input#teammate_image[name=?]", "teammate[image]"

      assert_select "input#teammate_name[name=?]", "teammate[name]"

      assert_select "input#teammate_team[name=?]", "teammate[team]"

      assert_select "input#teammate_title[name=?]", "teammate[title]"
    end
  end
end
