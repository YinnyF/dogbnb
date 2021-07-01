# frozen_string_literal: true

feature 'Viewing properties' do
  scenario 'Visiting properties page' do
    user = User.create(name: 'Testname', email: 'test@example.com', password: 'password123')
    property = Property.create(name: "Marus house", description: "Marus bed is great", price: "200", available_from: '2021-07-02', available_to: '2022-07-02', owner_id: user.id, image_route: 'test.jpg')

    visit '/property'
    expect(page).to have_content 'Marus house'
    expect(page).to have_content 'Marus bed is great'
    expect(page).to have_content 200.00
    expect(page).to have_content '2021-07-02'
    expect(page).to have_content '2022-07-02'
  end
end
