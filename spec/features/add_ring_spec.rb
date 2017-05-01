require 'rails_helper'

RSpec.feature 'add ring' do
	scenario 'visit add ring path' do
		visit '/rings/new' 

		expect(page).to have_content('Add New Ring')
	end


end
