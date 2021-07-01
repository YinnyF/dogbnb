feature 'Adding multiple properties' do
  scenario 'User can list multiple properties' do
    sign_in
    
    visit '/property/new'
    fill_in 'name', with: 'Property 1'
    fill_in 'description', with: 'Its ok'
    fill_in 'price', with: 20
    click_button 'Submit'

    visit '/property/new'
    fill_in 'name', with: 'Property 2'
    fill_in 'description', with: 'Its nice'
    fill_in 'price', with: 100
    click_button 'Submit'

    expect(page).to have_content 'Property 1'
    expect(page).to have_content 'Property 2'
  end
end