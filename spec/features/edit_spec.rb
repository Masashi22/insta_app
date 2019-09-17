require 'rails_helper'

RSpec.feature "edit" do
  before do
    @user = create(:user)
  end

  scenario "edit name successfully" do
    login(@user)
    visit edit_user_registration_path
    fill_in "名前", with: "aaa"
    fill_in "現在のパスワード", with: @user.password
    click_button "更新する"
    expect(current_path).to eq my_page_path
  end

  scenario "edit email successfully" do
    login(@user)
    visit edit_user_registration_path
    fill_in "メールアドレス", with: "aaa@example.com"
    fill_in "現在のパスワード", with: @user.password
    click_button "更新する"
    expect(current_path).to eq my_page_path
  end

  scenario "edit password successfully" do
    login(@user)
    visit edit_user_registration_path
    fill_in "パスワード", with: "aaaaaa"
    fill_in "確認用パスワード", with: "aaaaaa"
    fill_in "現在のパスワード", with: @user.password
    click_button "更新する"
    expect(current_path).to eq my_page_path
  end

  scenario "failure because not current_password" do
    login(@user)
    visit edit_user_registration_path
    fill_in "名前", with: "aaa"
    fill_in "現在のパスワード", with: " "
    click_button "更新する"
    expect(current_path).to eq user_registration_path
  end

  scenario "edit name is failure because name is blank" do
    login(@user)
    visit edit_user_registration_path
    fill_in "名前", with: " "
    fill_in "現在のパスワード", with: @user.password
    click_button "更新する"
    expect(current_path).to eq user_registration_path
  end
end
