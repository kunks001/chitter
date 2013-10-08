require_relative 'spec_helper'

feature "User adds cheeps" do

  before(:each) do
    User.create(:email => "test@test.com", 
    						:username => "tester",
                :password => 'test', 
                :password_confirmation => 'test')
    sign_in('test@test.com', 'test')
    visit '/'
  end

  scenario "on index page" do
    fill_in 'content', :with => "this is my first ever cheep"
    click_button "Post"
    expect(page).to have_content("this is my first ever cheep")
    expect(page).to have_content("tester")
  end

  def sign_in(email, password)
    visit '/sessions/new'
    fill_in 'email', :with => email
    fill_in 'password', :with => password
    click_button 'Sign in'
  end
end