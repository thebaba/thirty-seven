require 'rails_helper'

RSpec.describe "factoids/edit", type: :view do
  before(:each) do
    @factoid = assign(:factoid, Factoid.create!(
      :summary => "MyString",
      :body => "MyText",
      :note => "MyText"
    ))
  end

  it "renders the edit factoid form" do
    render

    assert_select "form[action=?][method=?]", factoid_path(@factoid), "post" do

      assert_select "input#factoid_summary[name=?]", "factoid[summary]"

      assert_select "textarea#factoid_body[name=?]", "factoid[body]"

      assert_select "textarea#factoid_note[name=?]", "factoid[note]"
    end
  end
end
