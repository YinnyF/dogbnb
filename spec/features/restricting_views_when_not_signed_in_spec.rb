# frozen_string_literal: true

feature 'Restricting views when not signed in' do
  scenario 'user tries to add a space' do
    visit '/property/new'
    expect(page).to have_content 'Please log in first'
    expect(current_path).to eq '/sessions/new'
  end

  scenario 'user trying to book is redirected to sign in page' do
    user = User.create(name: 'fake host', email: 'fakehost@example.com', password: 'password123')
    Property.create(
      name: 'Marus Crib', description: 'Marus bed is great', price: '200',
      available_from: '2021-07-02', available_to: '2022-07-02',
      owner_id: user.id, image_route: 'test.jpg'
    )
    visit '/property'
    click_button 'Book'
    expect(page).not_to have_button 'Confirm'
    expect(page).not_to have_content 'Your booking request has been sent.'
    expect(page).to have_content 'Please log in first'
    expect(current_path).to eq '/sessions/new'
  end
end

feature 'Restricting views when not signed in' do
  scenario 'trying to access myaccount page' do
    visit '/myaccount'
    expect(page).to have_content 'Please log in first'
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
