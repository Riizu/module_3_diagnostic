require 'rails_helper'

RSpec.feature 'A vistor can search for a given zip code' do
  context 'Valid' do
    scenario 'They visit the root path' do
      visit '/'
      fill_in 'zip', with: '80203'
      click_on 'Locate'

      expect(current_path).to eq '/search?zip=80203'
      expect(page).to have_selector('.station', count: 10)


    end
  end
end
