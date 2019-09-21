require 'rails_helper'

RSpec.feature "Sign Up", :devise do
  before do
    @user = build(:user)
  end

  scenario "sign up successfully" do
    sign_up_with(@user)
    expect(current_path).to eq new_user_session_path
  end

  scenario "sign up fail because email is invalid" do
    @different_email = build(:user, email: "aaaa")
    visit new_user_registration_path
    fill_in "名前", with: @different_email.username
    fill_in "メールアドレス", with: @different_email.email
    fill_in "パスワード", with: @different_email.password
    fill_in "確認用パスワード", with: @different_email.password
    click_button "登録する"
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
    visit new_user_registration_path
    fill_in "名前", with: @no_username.username
    fill_in "メールアドレス", with: @no_username.email
    fill_in "パスワード", with: @no_username.password
    fill_in "確認用パスワード", with: @no_username.password
    click_button "登録する"
    expect(current_path).to eq user_registration_path
  end
end
