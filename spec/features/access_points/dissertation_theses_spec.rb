require 'spec_helper'

describe 'Dissertation Theses Access Point' do
  before do
    visit root_path
    click_link 'Dissertations & theses'
  end
  it 'should have a custom page title' do
    expect(page).to have_title('Dissertation theses in SearchWorks')
  end
  it 'should include the dissertation/theses masthead' do
    within(".dissertation-theses-masthead") do
      expect(page).to have_css('h1', text: 'Dissertations and theses')
      expect(page).to have_css('li', count: 3)
    end
  end
end
