require 'spec_helper'

describe "Static pages" do

	describe "About page" do

		it "should have the content 'Michael Klambatsen" do
			visit '/static_pages/about'
			page.should have_content('Michael Klambatsen')
		end

		it "should have the right title" do
			visit '/static_pages/about'
			page.should have_selector('title', text: "March of the Meanies | About")
		end

	end
end
