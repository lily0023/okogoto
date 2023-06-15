module LoginMacros
  def login(user)
    visit login_path
    fill_in 'メールアドレス', with: user.email, match: :first
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end
end
