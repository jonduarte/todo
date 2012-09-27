require 'spec_helper'

feature "Lists" do
  scenario "Managing a list of tasks", :js => true do
    visit root_path
    click_link "Sign up"
    fill_in "Email", :with => "joe@joe.com"
    fill_in "Password", :with => "123456"
    fill_in "Password confirmation", :with => "123456"
    click_button "Sign up"
    page.should have_content("Logout")
    click_link "New"
    fill_in "Title", :with => "Build an app"
    click_button "Create List"
    page.should have_content("Title: Build an app")
    page.should have_content("Tasks")

    fill_in "Title", :with => "write features"
    click_button "Create Task"
    page.should have_content("write features")

    within("#tasks") do
      click_link "Delete"
    end

    page.driver.browser.switch_to.alert.accept
    page.should_not have_content("write features")

    fill_in "Title", :with => "code a lot"
    find("#new_task").check "task[done]"
    click_button "Create Task"
    page.should have_content("code a lot")

    find('input[title="Check for complete"]').checked?.should be_true

    find('input[title="Check for complete"]').should be_checked
    find('input[title="Check for complete"]').set(false)
    find('input[title="Check for complete"]').checked?.should be_false

    visit lists_path
    click_link "Build an app"
    find('input[title="Check for complete"]').checked?.should be_false
  end
end
