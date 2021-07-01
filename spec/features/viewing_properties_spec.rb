# frozen_string_literal: true

feature 'Viewing properties' do
  scenario 'Visiting properties page' do
    user = User.create(name: 'Testname', email: 'test@example.com', password: 'password123')
    Property.create(name: 'boris', description: 'x', price: "1", owner_id: user.id, image_route: 'test.jpg')

    visit '/property'
    expect(page).to have_content 'boris'
    expect(page).to have_content 'x'
    expect(page).to have_content 1.00
  end
end
