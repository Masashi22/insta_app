module SignupMacros
  def sign_up_with(username, email, password, confirmation)
    visit new_user_registration_path
    fill_in "名前", with: username
    fill_in "メールアドレス", with: email
    fill_in "パスワード", with: password
    fill_in "確認用パスワード", with: confirmation
    click_button "登録する"
  end
end
