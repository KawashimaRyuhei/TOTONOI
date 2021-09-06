module SignInSupport
  def sign_in(user)
    basic_pass root_path
    expect(body).to have_content('新規登録')
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    find('input[name="commit"]').click
    expect(current_path).to eq root_path
  end
end