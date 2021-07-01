# frozen_string_literal: true

feature 'Viewing properties' do
  scenario 'Visiting properties page' do
    Property.create(name: 'boris', description: 'x', price: '1', available_from: '2021-07-02', available_to: '2022-07-02')
    visit '/property'
    expect(page).to have_content 'boris'
    expect(page).to have_content 'x'
    expect(page).to have_content 1.00
    expect(page).to have_content '2021-07-02'
    expect(page).to have_content '2022-07-02'

  end
end
