# frozen_string_literal: true

feature 'Viewing properties' do
  scenario 'Visiting properties page' do
    user = User.create(name: 'Testname', email: 'test@example.com', password: 'password123')
    Property.create(name: 'boris', description: 'x', price: "1", available_from: '2021-07-02', available_to: '2022-07-02', owner_id: user.id)

    visit '/property'
    expect(page).to have_content 'boris'
    expect(page).to have_content 'x'
    expect(page).to have_content 1.00
    expect(page).to have_content '2021-07-02'
    expect(page).to have_content '2022-07-02'
  end
end
