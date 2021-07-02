# frozen_string_literal: true

feature 'Requesting a booking' do
  scenario 'a renter can make a booking request' do
    user = User.create(name: 'Testname', email: 'test@example.com', password: 'password123')
    Property.create(
      name: 'Marus house', description: 'Marus bed is great', price: '200',
      available_from: '2021-07-02', available_to: '2022-07-02',
      owner_id: user.id, image_route: 'test.jpg'
    )

    create_user_and_sign_in
    visit '/property'
    first('.property').click_button 'Book'
    click_button 'Confirm'

    expect(page).to have_content 'Your booking request has been sent.'
    expect(current_path).to eq '/property'
  end
end

feature 'Requesting a booking' do
  scenario 'a renter can cancel a booking request at the confirmation page' do
    user = User.create(name: 'Testname', email: 'test@example.com', password: 'password123')
    Property.create(
      name: 'Marus house', description: 'Marus bed is great', price: '200',
      available_from: '2021-07-02', available_to: '2022-07-02',
      owner_id: user.id, image_route: 'test.jpg'
    )

    create_user_and_sign_in
    visit '/property'
    first('.property').click_button 'Book'
    click_button 'Go Back'

    expect(current_path).to eq '/property'
  end

  scenario 'a renter can review booking before confirmation' do
    user = User.create(name: 'Testname', email: 'test@example.com', password: 'password123')
    Property.create(
      name: 'Marus house', description: 'Marus bed is great', price: '200',
      available_from: '2021-07-02', available_to: '2022-07-02',
      owner_id: user.id, image_route: 'test.jpg'
    )

    create_user_and_sign_in
    visit '/property'
    first('.property').click_button 'Book'

    expect(page).to have_content 'Marus house'
    expect(page).to have_content 'Marus bed is great'
    expect(page).to have_content '200'
    expect(page).to have_content '2021-07-02'
    expect(page).to have_content '2022-07-02'
    expect(page).to have_xpath "//img[contains(@src,'test.jpg')]"
  end
end
