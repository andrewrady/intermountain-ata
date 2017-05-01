require "rails_helpers"


RSpec.feature 'ensure routes are working' do
	scenario 'root path is working' do
		visit '/'
		expect(page).to have_content('Looking for rings?')
	end	

end
