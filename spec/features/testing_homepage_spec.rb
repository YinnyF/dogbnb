# frozen_string_literal: true

feature 'Testing homepage' do
  scenario 'viewing homepage' do
    visit '/'
    expect(page).to have_content 'Hello DogBnB!'
  end
end
