require_relative 'spec_helper'

feature "GETting cheeps/index" do
  include Rack::Test::Methods

  it "returns correct JSON" do
    browser = Rack::Test::Session.new(Rack::MockSession.new(Chitter)) 

    browser.get :cheeps
    response = browser.last_response
    response.should be_ok
    body = JSON.parse(response.body)
    body.class.should eq Array
    cheep = body[0]
    cheep.should have(4).items
    body.all? {|hash| hash.key?('content')}.should be_true
  end
end