feature 'Requesting a booking' do
  scenario 'a renter can make a booking request' do
    user = User.create(name: 'Testname', email: 'test@example.com', password: 'password123')
    Property.create(name: "Marus house", description: "Marus bed is great", price: "200", owner_id: user.id)
    
    sign_in
    visit '/property'
    first('.property').click_button 'Book'
    fill_in 'email', with: 'test@test.com'
    click_button 'Confirm'

    expect(page).to have_content "Your booking request has been sent."
    expect(current_path).to eq "/property"
  end

end