require 'spec_helper'

describe 'search' do

	it 'should return a valid result when searching for events' do
		visit '/search/new'
		fill_in 'artist', 'Slayer'
		fill_in 'location', 'London'
		expect(page).to have_css '.result', text: 'Slayer'
	end

end