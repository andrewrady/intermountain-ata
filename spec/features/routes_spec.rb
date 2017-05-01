require "rails_helper"


RSpec.feature 'ensure routes are working' do
	scenario 'root path is working' do
		visit '/'
		expect(page).to have_content('Looking for rings?')
	end	


	scenario 'rings path is working' do
		visit '/rings'

		expect(page).to have_content('Rings')
	end
end
