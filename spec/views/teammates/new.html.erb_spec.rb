require 'rails_helper'

RSpec.describe "teammates/new", :type => :view do
  before(:each) do
    assign(:teammate, Teammate.new(
      :image => "MyString",
      :name => "MyString",
      :team => "MyString",
      :title => "MyString"
    ))
  end

  it "renders new teammate form" do
    render

    assert_select "form[action=?][method=?]", teammates_path, "post" do

      assert_select "input#teammate_image[name=?]", "teammate[image]"

      assert_select "input#teammate_name[name=?]", "teammate[name]"

      assert_select "input#teammate_team[name=?]", "teammate[team]"

      assert_select "input#teammate_title[name=?]", "teammate[title]"
    end
  end
end
