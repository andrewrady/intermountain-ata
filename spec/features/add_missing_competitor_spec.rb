require 'rails_helper'

RSpec.feature 'allows missing competitor' do
	scenario 'add missing competitors name' do
		ring = create(:ring)
		sign_in_user
		visit '/rings/1/edit'

		click_button('Missing Competitor')

		fill_in "Name", with: "Andrew Rady"

		click_button('Add Name')

		expect(page).to have_content('Andrew Rady')
	end

end
