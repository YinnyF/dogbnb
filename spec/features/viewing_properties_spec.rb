# frozen_string_literal: true

feature 'Viewing properties' do
  scenario 'Visiting properties page' do
    Property.create(name: 'boris', description: 'x', price: "1")

    visit '/property'
    expect(page).to have_content 'boris'
    expect(page).to have_content 'x'
    expect(page).to have_content 1.00
  end
end
