require 'rails_helper'

RSpec.feature 'add ring' do
	scenario 'visit add ring path' do
		visit '/rings/new' 

		expect(page).to have_content('Add New Ring')
	end



	scenario 'add ring number' do
		visit '/rings/new'

		fill_in 'Ring number', with: '1'	
	
		click_button('Submit')

		expect(page).to have_content('1')
	end

	scenario 'add ring rank' do
		visit 'rings/new'

		fill_in 'Ring rank', with: 'white-yellow'

		click_button('Submit')

		expect(page).to have_content('white-yellow')
	end
	
	scenario 'add ring age' do
		visit 'rings/new'

		fill_in 'Ring age', with: '18-29'

		click_button('Submit')

		expect(page).to have_content('18-29')
	end

	scenario 'add ring gender' do
		visit 'rings/new'

		fill_in 'Ring gender', with: 'Men'

		click_button('Submit')

		expect(page).to have_content('Men')
	end


end
