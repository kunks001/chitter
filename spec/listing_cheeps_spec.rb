require_relative 'spec_helper'

feature "GETting cheeps/index" do
  include Rack::Test::Methods

  before(:each) do
    User.create(:email => "test@test.com", 
                :username => "tester",
                :password => 'test', 
                :password_confirmation => 'test')
    sign_in('test@test.com', 'test')
    visit '/'
  end
 
  scenario "returns correct JSON" do
    browser = Rack::Test::Session.new(Rack::MockSession.new(Chitter)) 
    fill_in 'content', :with => 'Hi there'
    click_button 'Post'

    browser.get :cheeps
    response = browser.last_response
    response.should be_ok
    body = JSON.parse(response.body)
    body.class.should eq Array
    cheep = body.shift
    cheep.should have(4).items
    body.all? {|hash| hash.key?('content')}.should be_true
  end

  def sign_in(email, password)
    visit '/sessions/new'
    fill_in 'email', :with => email
    fill_in 'password', :with => password
    click_button 'Sign in'
  end
end
