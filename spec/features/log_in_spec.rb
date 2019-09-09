feature 'log in' do
  scenario 'login successfully' do
    sign_up_with("aaaa@example.com", "password", "password")
    expect(current_path).to eq my_page_path
    logout
    expect(current_path).to eq root_path
    login("aaaa@example.com", "password")
    expect(current_path).to eq my_page_path
  end

  scenario 'login fail because email is different' do
    sign_up_with("aaaa@example.com", "password", "password")
    expect(current_path).to eq my_page_path
    logout
    expect(current_path).to eq root_path
    login("aaaaaa", "password")
    expect(current_path).to eq new_user_session_path
  end

  scenario 'login fail because password is different' do
    sign_up_with("aaaa@example.com", "password", "password")
    expect(current_path).to eq my_page_path
    logout
    expect(current_path).to eq root_path
    login("aaaa@example.com", "a")
    expect(current_path).to eq new_user_session_path
  end
end
