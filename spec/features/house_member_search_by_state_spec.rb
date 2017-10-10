require 'rails_helper'

feature "User can search for house members by state" do
  it "returns a list of members" do
    visit "/"
    select "Colorado", from: :state
    click_on "Locate Members of the House"
    expect(current_path).to eq "/search"
    expect(page).to have_content "7 Results"
    expect(page).to have_css('.member', count: 7)

    # And they should be ordered by seniority from most to least

    within(first('.member')) do
      expect(page).to have_css('.name')
      expect(page).to have_css('.role')
      expect(page).to have_css('.party')
      expect(page).to have_css('.district')
    end
  end
end
