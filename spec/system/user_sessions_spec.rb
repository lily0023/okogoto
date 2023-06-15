RSpec.describe 'UserSessions', type: :system do
  let(:user){ create(:user) }
  describe 'ログイン前' do
    context 'フォームの入力値が正常' do
      it 'ログイン処理が成功する' do
        login(user)
        expect(page).to have_content 'ログインしました'
        expect(current_path).to eq posts_path
      end
    end
    context 'フォームが未入力' do
      it 'ログイン処理が失敗する' do
        visit login_path
        fill_in 'メールアドレス', with: nil, match: :first
        fill_in 'パスワード', with: nil
        click_button 'ログイン'
        expect(page).to have_content 'ログインに失敗しました'
        expect(current_path).to eq login_path
      end
    end
  end

  describe 'ログイン後' do
    context 'ログアウトボタンをクリック' do
      it 'ログアウト処理が成功する' do
        login(user)
        find('#header-menu').click
        click_button 'ログアウト'
        expect(page).to have_content 'ログアウトしました'
        expect(current_path).to eq login_path
      end
    end
  end
end
