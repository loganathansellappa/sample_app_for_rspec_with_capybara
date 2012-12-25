require 'spec_helper'

describe "Users" do
  context "List index page without Users" do
    it "List Users" do
      visit users_path
      page.should have_content('Listing users')
      page.should have_no_content("Test")
    end
  end

  context "List index page with Users" do
    it "List Users" do
      user = Factory(:user)
      visit users_path
      page.should have_content('Listing users')
      page.should have_content(user.name)
    end
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
    user = Factory(:user)
    visit users_path
    #save_and_open_page
    click_link "Edit"
    #save_and_open_page
    fill_in "Name", with: "Edited name"
    fill_in "Email", with: "Edited email"
    fill_in "Description", with: "Edited description"
    click_button "Update User"
    # #save_and_open_page
    page.should have_content("User was successfully updated.")
    page.should have_content("Edited name")
    page.should have_content("Edited email")
    page.should have_content("Edited description")
  end

   it "Show User" do
    user = Factory(:user)
    visit user_path(user.id)
    page.should have_content(user.name)
    page.should have_content(user.email)
    page.should have_content(user.description)
  end
  
  it "Delete a User" do
    user = Factory(:user)
    visit users_path
    click_link "Destroy"
    page.should have_no_content(user.name)
    page.should have_no_content(user.email)
    page.should have_no_content(user.description)
  end

end
