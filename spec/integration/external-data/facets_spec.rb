require "spec_helper"

describe "Facets Customizations", feature: true, :"data-integration" => true  do
  describe "range limits" do
    it "should retain range parameters when navigating a range limited search", js: true do
      visit root_path

      fill_in 'q', with: 'search'
      click_button 'search'

      within('#facets') do
        click_link 'Date'

        click_button 'Apply'
      end

      within('.breadcrumb') do
        expect(page).to have_css('.filterName', text: "Date")
      end

      within("#facets") do
        click_link 'Access'

        click_link 'At the Library'
      end

      within('.breadcrumb') do
        expect(page).to have_css('.filterName', text: "Date")
      end
    end
  end
  describe "more links" do
    before do
      visit root_path
      fill_in 'q', with: 'search'
      click_button 'search'
    end
    describe "for standard facets" do
      it "should include 20 facet values" do
        within('#facets') do
          within('.facet_limit.blacklight-language') do
            expect(page).to have_css('li .facet-label', count: 20)
          end
        end
      end
      it "should include pluralized and downcased facet labels" do
        within('#facets') do
          within('.facet_limit.blacklight-language') do
            expect(page).to have_css('.more_facets_link', text: 'more languages')
          end
        end
      end
    end
    describe "for special facets" do
      it "should include more than 20 values" do
        within('#facets') do
          within('.facet_limit.blacklight-language') do
            expect(page).to have_css('li', count: 21)
          end
        end
      end
      it "should not include more links" do
        within('#facets') do
          within('.facet_limit.blacklight-building_facet') do
            expect(page).to_not have_css('.more_facets_link')
            expect(page).to_not have_content('more')
          end
        end
      end
    end
    describe 'database facet' do
      before do
        visit root_path
        click_link 'Database'
      end
      it 'should have more link' do
        within('#facets') do
          within('.facet_limit.blacklight-db_az_subject') do
            expect(page).to have_css('a', text: 'more')
          end
        end
      end
    end
  end
end
