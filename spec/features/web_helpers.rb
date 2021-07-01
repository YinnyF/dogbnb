def sign_in
  user = User.create(name: 'Testname', email: 'test@example.com', password: 'password123')
  visit '/sessions/new'
  fill_in(:email, with: user.email)
  fill_in(:password, with: 'password123')
  click_button('Sign in')
end
