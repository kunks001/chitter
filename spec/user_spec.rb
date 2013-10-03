require_relative 'spec_helper'

feature 'The user signs up' do
  scenario 'when logged out' do
    expect(lambda{ sign_up }).to change(User, :count).by 1
    expect(page).to have_content 'Welcome to Chitter, johnny@john.com!'
    expect(User.first.email).to eq 'johnny@john.com'
  end

  scenario 'with a password that does not match' do
    expect(lambda{ sign_up("johnny@john.com", "foobar", "wrong") }).to change(User, :count).by 0
    expect(current_path).to eq('/users')   
    expect(page).to have_content("Password does not match the confirmation")
    expect(page).to have_content("Sign up")
  end

  scenario "with an email that is already registered" do    
    lambda { sign_up }.should change(User, :count).by(1)
    lambda { sign_up }.should change(User, :count).by(0)
    expect(page).to have_content("This email is already taken")
  end
end

def sign_up(  email="johnny@john.com", 
              password="foobar", 
              password_confirmation="foobar")
  visit '/users/new'
  page.should have_content "Sign up"
  fill_in :email,                 :with => email
  fill_in :password,              :with => password
  fill_in :password_confirmation, :with => password_confirmation
  click_button 'Sign up'  
end