require 'rails_helper'

RSpec.feature "Log in", :devise do
  before do
    @user = create(:user)
  end

  scenario 'successfully' do
    login(@user)
    expect(current_path).to eq user_path(@user)
    logout
    expect(current_path).to eq root_path
    login(@user)
    expect(current_path).to eq user_path(id: @user.id)
  end

  scenario 'fail because email is different' do
    @different_email = build(:user, email: "aaaa")
    login(@different_email)
    expect(current_path).to eq new_user_session_path
  end

  scenario 'fail because password is different' do
    @different_password = build(:user, password: "aaa")
    login(@different_password)
    expect(current_path).to eq new_user_session_path
  end
end
