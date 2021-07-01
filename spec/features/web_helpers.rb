def sign_in
  visit '/sessions/new'
  fill_in(:email, with: 'test@example.com')
  fill_in(:password, with: 'password123')
  click_button('Sign in')
end

def create_user_and_sign_in
  User.create(name: 'Testname', email: 'test@example.com', password: 'password123')
  sign_in
end
