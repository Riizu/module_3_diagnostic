require 'rails_helper'

RSpec.feature 'A vistor can search for a given zip code' do
  context 'Valid' do
    scenario 'They visit the root path' do
      visit '/'
      fill_in 'zip', with: '80203'
      click_on 'Locate'

      current_path_with_params = current_url.split('/')[-1]

      expect(current_path_with_params).to eq 'search?zip=80203'
      expect(page.all('.station').count).to be <= 10
      expect(page).to_not have_content("Name")
      expect(page).to_not have_content("Address")
      expect(page).to_not have_content("Fuel Types")
      expect(page).to_not have_content("Distance")
      expect(page).to_not have_content("Access Times")

      within '.fuel-type' do
        expect(page).to_not have_content("BD")
        expect(page).to_not have_content("CNG")
        expect(page).to_not have_content("E85")
        expect(page).to_not have_content("HY")
        expect(page).to_not have_content("LNG")
      end
    end
  end
end
