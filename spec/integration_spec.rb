require 'capybara/rspec'
require './app'
require 'pry'
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new project', {:type => :feature}) do
  it('allows a user to type in new project name') do
    visit('/')
    fill_in('project_name', :with => 'defeat Dodongo')
    click_button('Add Project')
    expect(page).to have_content('defeat Dodongo')
  end
end

describe('viewing all of the projects on the homepage', {:type => :feature}) do
  it('allows a user to see all of the projects that have been created') do
    project1 = Project.new({project_name: 'blast the Digdogger in the eye', id: 1})
    project1.save
    visit('/')
    expect(page).to have_content(project1.project_name)
  end
end

describe('seeing details for a single project', {:type => :feature}) do
  it('allows a user to click on a project to see the volunteers and details for it') do
    project1 = Project.new({project_name: 'Patra gets zapped with grappling hook', id: 1})
    project1.save
    visit('/')
    click_link(project1.project_name)
    expect(page).to have_content(project1.project_name)
    expect(page).to have_content('There are no volunteers on this project')
  end
end

describe('adding volunteers to a project', {:type => :feature}) do
  it('allows a user to add a volunteer to a project') do
    project1 = Project.new({project_name: 'Catch all the Cuccos', id: 3})
    project1.save
    visit('/')
    select('Catch all the Cuccos', from: 'project_id')
    fill_in('volunteer_name', {with: 'Link'})
    click_button('Add')
    expect(page).to have_content('Link')
  end
end
