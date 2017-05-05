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

describe('viewing all of the projects', {:type => :feature}) do
  it('allows a user to see all of the projects that have been created') do
    project1 = Project.new({:project_name => 'blast the Digdogger in the eye', :id => 1})
    project1.save
    visit('/')
    expect(page).to have_content(project1.project_name)
  end
end

# describe('seeing details for a single list', {:type => :feature}) do
#   it('allows a user to click a list to see the tasks and details for it') do
#     test_list = List.new({:name => 'School stuff', :id => 2})
#     test_list.save()
#     test_task = Task.new({:description => "learn SQL", :list_id => test_list.id()})
#     test_task.save()
#     visit('/')
#     click_link(test_list.name())
#     expect(page).to have_content(test_task.description())
#   end
# end
#
# describe('adding tasks to a list', {:type => :feature}) do
#   it('allows a user to add a task to a list') do
#     test_list = List.new({:name => 'School stuff', :id => 3})
#     test_list.save()
#     visit("/")
#     select('School stuff', :from => 'list_id')
#     fill_in("Description", {:with => "learn SQL"})
#     click_button("Add task")
#     expect(page).to have_content("learn SQL")
#   end
# end
