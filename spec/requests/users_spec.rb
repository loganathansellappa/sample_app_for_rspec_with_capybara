require 'spec_helper'

describe "Users" do
  #describe "GET /users" do
    it "List Users" do
      visit users_path
      page.should have_content('Listing users')
    end

  it "Create a New User" do
      visit users_path
      user = Factory(:user)
      click_link "New User"
      fill_in "Name", with: user.name
      fill_in "Email", with: user.email
      fill_in "Description", with: user.description
      click_button "Create User"
      #save_and_open_page
      page.should have_content("User was successfully created.")
      page.should have_content(user.name)
      page.should have_content(user.email)
      page.should have_content(user.description)
    end

  it "Edit a User" do
      visit users_path
      user = Factory(:user)
      save_and_open_page
      click_link "Edit"
      fill_in "Name", with: user.name
      fill_in "Email", with: user.email
      fill_in "Description", with: user.description
      click_button "Create User"
      save_and_open_page
      page.should have_content("User was successfully created.")
      page.should have_content(user.name)
      page.should have_content(user.email)
      page.should have_content(user.description)
    end
end
