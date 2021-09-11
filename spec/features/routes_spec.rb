require "rails_helper"


RSpec.feature 'ensure routes are working' do
	scenario 'root path is working' do
		visit '/rings'

		expect(page).to have_content('Rings')
	end
end
