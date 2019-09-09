require 'rails_helper'

RSpec.feature "Sign Up", :devise do
  scenario "visitor can sign up & log out" do
    sign_up_with("test@example.com", "password", "password")
    expect(current_path).to eq my_page_path
  end

  scenario "visitor can't sign up cause email" do
    sign_up_with("test", "password", "password")
    expect(current_path).to eq user_registration_path
  end

  scenario "visitor can't sign up cause password is different" do
    sign_up_with("test", "password", "aaaaaa")
    expect(current_path).to eq user_registration_path
  end
end
