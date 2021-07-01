# frozen_string_literal: true

feature 'Restricting views when not signed in' do
  scenario 'user tries to add a space' do
    visit '/property/new'

    expect(current_path).to eq "/sessions/new"
  end

  scenario 'user trying to book is redirected to sign in page' do
    user = User.create(name: 'fake host', email: 'fakehost@example.com', password: 'password123')
    Property.create(name: "Marus house", description: "Marus bed is great", price: "200", owner_id: user.id)
    visit '/property'
    click_button 'Book'

    expect(page).not_to have_button 'Confirm'
    expect(page).not_to have_content "Your booking request has been sent."
    expect(current_path).to eq "/sessions/new"
  end

  scenario 'trying to access myaccount page' do
    visit '/myaccount'

    expect(current_path).to eq '/sessions/new'
  end

  scenario 'viewing properties' do
    visit '/property'

    expect(page).not_to have_button 'My Account'
    expect(page).not_to have_button 'Add a Property'
    expect(page).to have_button 'Sign up'
    expect(page).to have_button 'Sign in'
  end
end
