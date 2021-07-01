# frozen_string_literal: true

feature 'Restricting views when signed in' do
  background do
    User.create(name: 'Testname', email: 'test@example.com', password: 'password123')
    sign_in
  end

  scenario 'user tries to view homepage' do
    visit '/'

    expect(page).not_to have_content "Create your account today"
    expect(page).not_to have_button "Sign in"
    expect(page).to have_button "My Account"
    expect(page).to have_button "Add a Property"
    expect(page).to have_button "Sign out"
    expect(current_path).to eq "/property"
  end

  scenario 'user tries to view sign in page again' do
    visit '/sessions/new'

    expect(page).not_to have_button "Sign in"
    expect(current_path).to eq "/property"
  end

  scenario 'user tries to sign up' do
    visit '/users/new'

    expect(page).not_to have_content "Sign up"
    expect(current_path).to eq "/property"
  end

  scenario 'user accesses My Account' do
    visit '/myaccount'

    expect(page).to have_button "Add a Property"
    expect(page).to have_button "View Properties"
    expect(page).to have_button "Sign out"
  end
end
