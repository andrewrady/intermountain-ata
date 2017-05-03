require 'rails_helper'


RSpec.feature 'edit ring' do	
	scenario 'visit edit ring path' do
		ring = create(:ring)
		sign_in_user
		visit '/rings/1/edit'

		expect(page).to have_content('Edit Ring')
	end

	scenario 'change ring number' do
		ring = create(:ring)
		sign_in_user
		visit '/rings/1/edit'

		fill_in 'Ring number', with: '2'

		click_button('Submit')

		expect(page).to have_content('2')
	end


	scenario 'change ring rank' do
		ring = create(:ring)
		sign_in_user
		visit '/rings/1/edit'

		fill_in 'Ring rank', with: 'Black Belts'
	
		click_button('Submit')

		expect(page).to have_content('Black Belts')
	end

	scenario 'change ring age' do
		ring = create(:ring)
		sign_in_user
		visit '/rings/1/edit'

		fill_in 'Ring age', with: '30-39'
	
		click_button('Submit')

		expect(page).to have_content('30-39')
	end


	scenario 'change ring gender' do
		ring = create(:ring)
		sign_in_user
		visit '/rings/1/edit'

		fill_in 'Ring gender', with: 'Men'
	
		click_button('Submit')

		expect(page).to have_content('Men')
	end



end
