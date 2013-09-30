require_relative 'spec_helper'

feature 'The user signs up' do
  scenario 'when logged out' do
    expect(lambda{ sign_up }).to change(User, :count).by 1
    expect(page).to have_content 'Welcome to Chitter, johnny@john.com!'
    expect(User.first.email).to eq 'johnny@john.com'
  end
end

def sign_up(email="johnny@john.com", password="foobar")
  visit '/users/new'
  page.should have_content "Sign up"
  fill_in :email, :with => email
  fill_in :password, :with => password
  click_button 'Sign up'  
end