module SignupMacros
  def sign_up_with(user)
    visit new_user_registration_path
    fill_in "名前", with: user.username
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    fill_in "確認用パスワード", with: user.password
    click_button "登録する"
  end
end
