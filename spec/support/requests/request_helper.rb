# encoding: utf-8

def sign_in_as(user)
  visit new_user_session_path
  
  fill_in "user_email",     :with => user.email
  fill_in "user_password",  :with => user.password
  
  click_button "Sign in"
end

def sign_out
  visit destroy_user_session_path
end
