require 'spec_helper'

describe "PasswordResets" do

  it "emails user when requesting password reset" do
    user = FactoryGirl.create(:user)
    visit new_session_url
    click_link "password"
    fill_in "Email", :with => user.email
    click_button "Reset Password"

    current_path.should eq(new_session_path)
    page.should have_content("Email Sent")
    last_email.to.should include(user.email)
  end

  it "does not email invalid user when requesting password reset" do
    visit new_session_path
    click_link "password"
    fill_in "Email", :with => "nobody@example.com"
    click_button "Reset Password"
    current_path.should eq(new_session_path)
    page.should have_content("Email Sent")
    last_email.should be_nil
  end


  # I added the following specs after recording the episode. It literally
  # took about 10 minutes to add the tests and the implementation because
  # it was easy to follow the testing pattern already established.

  it "updates the user password " do
    user = FactoryGirl.create(:user, :password_reset_token => "something", :password_reset_sent_at => 1.hour.ago)
    visit edit_password_reset_path(user.id,user.password_reset_token)
    page.should have_content("Fuck off")
    current_path.should eq(edit_password_reset_path(user.id,user.password_reset_token))
    fill_in "Password", :with => "foobar"
    click_button "Update password"
    page.should have_content("Password has been reset")
  end

  it "reports when password token has expired" do
    user = FactoryGirl.create(:user, :password_reset_token => "something", :password_reset_sent_at => 5.hour.ago)
    visit edit_password_reset_path(user.password_reset_token)
    fill_in "Password", :with => "foobar"
    click_button "Update Password"
    page.should have_content("Password reset has expired")
  end

  it "raises record not found when password token is invalid" do
    visit edit_password_reset_path("invalid")

    page.should have_content("Fuck off")
  end
end