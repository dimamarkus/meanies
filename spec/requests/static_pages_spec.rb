require 'spec_helper'

describe "Static pages" do

	describe "About page" do

		it "should have the content 'Michael Klambatsen" do
			visit '/static_pages/about'
			page.should have_content('Michael Klambatsen')
		end
	end
end
