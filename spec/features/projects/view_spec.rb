require "rails_helper"

RSpec.feature "Users can view projects" do
  let(:project_repo) { ProjectRepository.new(ROM.env) }
  let!(:project) { project_repo.create(name: "Shopify") }

  scenario "with the project details" do
    visit "/"
    click_link "Shopify"
    expect(page.current_url).to eq projects_project_url(project)
    within("h2") do
      expect(page).to have_content "Shopify"
    end
  end
end
