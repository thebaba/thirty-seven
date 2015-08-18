require 'rails_helper'

RSpec.describe "factoids/show", type: :view do
  before(:each) do
    @factoid = assign(:factoid, Factoid.create!(
      :summary => "Summary",
      :body => "MyText",
      :note => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Summary/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
