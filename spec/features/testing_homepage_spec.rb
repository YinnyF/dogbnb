feature 'Testing homepage' do
  scenario 'viewing homepage' do
    visit '/'
    expect(page).to have_content 'Welcome to DogBnB!'
  end
end