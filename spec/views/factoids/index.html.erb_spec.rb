require 'rails_helper'

RSpec.describe "factoids/index", type: :view do
  before(:each) do
    assign(:factoids, [
      Factoid.create!(
        :summary => "Summary",
        :body => "MyText",
        :note => "MyNote"
      ),
      Factoid.create!(
        :summary => "Summary",
        :body => "MyText",
        :note => "MyNote"
      )
    ])
  end

  it "renders a list of factoids" do
    render
    assert_select "tr>td", :text => "Summary".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyNote".to_s, :count => 2
  end
end
