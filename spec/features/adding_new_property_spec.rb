# frozen_string_literal: true

feature 'Providing description' do
  scenario 'User can add a description and price' do
    User.create(name: 'Testname', email: 'test@example.com', password: 'password123')
    sign_in
    
    visit '/property/new'
    fill_in 'name', with: 'Marus Crib.'
    fill_in 'description', with: 'This is a nice place.'
    fill_in 'price', with: 100
    click_button 'Submit'

    expect(page).to have_content 'Marus Crib.'
    expect(page).to have_content 'This is a nice place.'
    expect(page).to have_content '100'
  end
end
