feature 'Requesting a booking' do
  scenario 'a renter can make a booking request' do
    user = User.create(name: 'Testname', email: 'test@example.com', password: 'password123')
    property = Property.create(name: "Marus house", description: "Marus bed is great", price: "200", available_from: '2021-07-02', available_to: '2022-07-02', owner_id: user.id, image_route: 'test.jpg')
    
    sign_in
    visit '/property'
    first('.property').click_button 'Book'
    click_button 'Confirm'

    expect(page).to have_content "Your booking request has been sent."
    expect(current_path).to eq "/property"
  end

end