require 'rails_helper'

RSpec.feature "Sign Up", :devise do
  before do
    @user = build(:user)
  end

  scenario "sign up successfully" do
    sign_up_with(@user)
    expect(current_path).to eq my_page_path
  end

  scenario "sign up fail because email is invalid" do
    @different_email = build(:user, email:"aaaa")
    sign_up_with(@different_email)
    expect(current_path).to eq user_registration_path
  end

  scenario "sign up fail because password is different" do
    visit new_user_registration_path
    fill_in "名前", with: @user.username
    fill_in "メールアドレス", with: @user.email
    fill_in "パスワード", with: @user.password
    fill_in "確認用パスワード", with: "aaaa"
    click_button "登録する"
    expect(current_path).to eq user_registration_path
  end

  scenario 'sign up fail because username is nil' do
    @no_username = build(:user, username: " ")
    sign_up_with(@no_username)
    expect(current_path).to eq user_registration_path
  end
end
