RSpec.describe 'AdminLogin', type: :system do
  let(:admin_user){ create(:user, :admin) }
  let(:general_user){ create(:user, :general) }
  describe '管理者画面へのログイン' do
    context '管理者ユーザーの場合' do
      it '管理画面のダッシュボードに遷移する' do
        visit admin_login_path
        fill_in 'メールアドレス', with: admin_user.email
        fill_in 'パスワード', with: 'password'
        click_button 'ログイン'
        expect(page).to have_content '管理者としてログインしました'
        expect(current_path).to eq admin_root_path
      end
    end
    context '一般ユーザーの場合' do
      it 'オコゴトのトップページに遷移する' do
        visit admin_login_path
        fill_in 'メールアドレス', with: general_user.email
        fill_in 'パスワード', with: 'password'
        click_button 'ログイン'
        expect(page).to have_content '管理者権限がありません'
        expect(current_path).to eq root_path
      end
    end
  end
end
