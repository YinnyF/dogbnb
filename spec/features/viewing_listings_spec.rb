feature 'Viewing listings' do
  scenario 'Visiting listing page' do
    visit '/listings'
    expect(page).to have_content("Maru's Crib")
    expect(page).to have_content("Maru's Garage")
  end
end