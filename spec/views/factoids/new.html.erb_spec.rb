require 'rails_helper'

RSpec.describe "factoids/new", type: :view do
  before(:each) do
    assign(:factoid, Factoid.new(
      :summary => "MyString",
      :body => "MyText",
      :note => "MyText"
    ))
  end

  it "renders new factoid form" do
    render

    assert_select "form[action=?][method=?]", factoids_path, "post" do

      assert_select "input#factoid_summary[name=?]", "factoid[summary]"

      assert_select "textarea#factoid_body[name=?]", "factoid[body]"

      assert_select "textarea#factoid_note[name=?]", "factoid[note]"
    end
  end
end
