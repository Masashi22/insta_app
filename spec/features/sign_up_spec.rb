require 'rails_helper'

RSpec.feature "Sign Up", :devise do
  scenario "sign up successfully" do
    sign_up_with("aaaa", "test@example.com", "password", "password")
    expect(current_path).to eq my_page_path
  end

  scenario "sign up fail because email is nil" do
    sign_up_with("aaaa", "test", "password", "password")
    expect(current_path).to eq user_registration_path
  end

  scenario "sign up fail because password is different" do
    sign_up_with("aaaa", "test", "password", "aaaaaa")
    expect(current_path).to eq user_registration_path
  end

  scenario 'sign up fail because username is nil' do
    sign_up_with(" ", "aaaa@example.com", "password", "password")
    expect(current_path).to eq user_registration_path
  end
end
