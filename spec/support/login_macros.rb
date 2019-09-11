module LoginMacros
  def login(email, password)
    visit new_user_session_path
    fill_in "メールアドレス", with: email
    fill_in "パスワード", with: password
    click_button "ログイン"
  end

  def logout
    click_link 'log out'
  end
end
