require 'rails_helper'

RSpec.feature "Log in", :devise do
  before do
    @user = build(:user)
  end

  scenario 'login successfully' do
    @user = build(:user)
    sign_up_with(@user)
    expect(current_path).to eq my_page_path
    logout
    expect(current_path).to eq root_path
    login(@user)
    expect(current_path).to eq my_page_path
  end

  scenario 'login fail because email is different' do
    sign_up_with(@user)
    expect(current_path).to eq my_page_path
    logout
    expect(current_path).to eq root_path
    @different_email = build(:user, email: "aaaa")
    login(@different_email)
    expect(current_path).to eq new_user_session_path
  end

  scenario 'login fail because password is different' do
    sign_up_with(@user)
    expect(current_path).to eq my_page_path
    logout
    expect(current_path).to eq root_path
    @different_password = build(:user, password: "aaa")
    login(@different_password)
    expect(current_path).to eq new_user_session_path
  end
end
