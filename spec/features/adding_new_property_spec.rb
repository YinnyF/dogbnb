# frozen_string_literal: true

feature 'Providing description' do
  scenario 'Users can add a name, description, price and available dates from and to' do
    User.create(name: 'Testname', email: 'test@example.com', password: 'password123')
    sign_in

    visit '/property/new'
    fill_in 'name', with: 'Marus Crib.'
    fill_in 'description', with: 'This is a nice place.'
    fill_in 'price', with: 100
    fill_in 'available_from', with: '2021-07-02'
    fill_in 'available_to', with: '2022-07-02'
    click_button 'Submit'

    expect(page).to have_content 'Marus Crib.'
    expect(page).to have_content 'This is a nice place.'
    expect(page).to have_content '100'
    expect(page).to have_content '2021-07-02'
    expect(page).to have_content '2022-07-02'
  end
end
