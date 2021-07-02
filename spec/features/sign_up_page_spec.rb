# frozen_string_literal: true

feature 'signing up page' do
  scenario 'signing up to dogbnb' do
    visit '/users/new'
    fill_in('name', with: 'Testname')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    fill_in('confirm password', with: 'password123')
    click_button('Submit')

    expect(page).to have_content 'Welcome, Testname'
  end
end
