# frozen_string_literal: true

feature 'Restricting views when not signed in' do
  scenario 'a signed out user cannot add a space' do
    visit '/property/new'

    expect(page).not_to have_button 'Submit'
    expect(page).to have_content 'You must be logged in to do that.'
    expect(page).to have_button 'Sign in'
  end

  scenario 'a signed out user trying to add a space is guided to log in' do
    visit '/property/new'

    click_button 'My Account'
    click_button 'Sign in'
    expect(current_path).to eq "/sessions/new"
  end

  scenario 'a signed out user cannot book a space' do
    user = User.create(name: 'fake host', email: 'fakehost@example.com', password: 'password123')
    Property.create(name: "Marus house", description: "Marus bed is great", price: "200", owner_id: user.id)
    visit '/property'
    click_button 'Book'

    expect(page).not_to have_button 'Confirm'
    expect(page).not_to have_content "Your booking request has been sent."
    expect(page).to have_content 'You must be logged in to do that.'
  end
end
