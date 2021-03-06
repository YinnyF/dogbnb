# frozen_string_literal: true

def sign_in
  user = User.create(name: 'Testname', email: 'test@example.com', password: 'password123')
  visit '/sessions/new'
  fill_in(:email, with: user.email)
  fill_in(:password, with: 'password123')
  click_button('Sign in')
end

def create_user_and_sign_in
  User.create(name: 'Testname', email: 'test@example.com', password: 'password123')
  sign_in
end
