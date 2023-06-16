RSpec.describe 'Users', type: :system do
  describe 'ログイン前' do
    describe 'ユーザー登録' do
      before{ visit new_user_path }
      context 'フォームの入力値が正常' do
        it 'ユーザー登録が成功する' do
          fill_in 'メールアドレス', with: 'email@example.com'
          fill_in 'ニックネーム', with: 'name'
          select '20代', from: '年代'
          choose '女性'
          fill_in 'パスワード', with: 'password'
          fill_in 'パスワード確認', with: 'password'
          click_button '登録する'
          expect(page).to have_content 'ユーザー登録が完了しました'
          expect(current_path).to eq login_path
          end
      end
      context 'メールアドレスが未入力' do
        it 'ユーザー登録が失敗する' do
          fill_in 'メールアドレス', with: nil
          fill_in 'ニックネーム', with: 'name'
          select '20代', from: '年代'
          choose '女性'
          fill_in 'パスワード', with: 'password'
          fill_in 'パスワード確認', with: 'password'
          click_button '登録する'
          expect(page).to have_content 'ユーザー登録に失敗しました'
          expect(page).to have_content 'メールアドレスを入力してください'
          expect(current_path).to eq new_user_path
        end
      end
      context '登録済のメールアドレスを使用' do
        it 'ユーザーの新規作成が失敗する' do
          create(:user, email: 'test@example.com')
          fill_in 'メールアドレス', with: 'test@example.com'
          fill_in 'ニックネーム', with: 'name'
          select '20代', from: '年代'
          choose '女性'
          fill_in 'パスワード', with: 'password'
          fill_in 'パスワード確認', with: 'password'
          click_button '登録する'
          expect(page).to have_content 'ユーザー登録に失敗しました'
          expect(page).to have_content 'メールアドレスはすでに存在します'
          expect(current_path).to eq new_user_path
        end
      end
      context 'ニックネームが未入力' do
        it 'ユーザー登録が失敗する' do
          fill_in 'メールアドレス', with: 'email@example.com'
          fill_in 'ニックネーム', with: nil
          select '20代', from: '年代'
          choose '女性'
          fill_in 'パスワード', with: 'password'
          fill_in 'パスワード確認', with: 'password'
          click_button '登録する'
          expect(page).to have_content 'ユーザー登録に失敗しました'
          expect(page).to have_content 'ニックネームを入力してください'
          expect(current_path).to eq new_user_path
        end
      end
      context 'パスワードが未入力' do
        it 'ユーザー登録が失敗する' do
          fill_in 'メールアドレス', with: 'email@example.com'
          fill_in 'ニックネーム', with: 'name'
          select '20代', from: '年代'
          choose '女性'
          fill_in 'パスワード', with: nil
          fill_in 'パスワード確認', with: 'password'
          click_button '登録する'
          expect(page).to have_content 'ユーザー登録に失敗しました'
          expect(page).to have_content 'パスワードは6文字以上で入力してください'
          expect(current_path).to eq new_user_path
        end
      end
      context 'パスワードとパスワード確認が異なる' do
        it 'ユーザー登録が失敗する' do
          fill_in 'メールアドレス', with: 'email@example.com'
          fill_in 'ニックネーム', with: 'name'
          select '20代', from: '年代'
          choose '女性'
          fill_in 'パスワード', with: 'password'
          fill_in 'パスワード確認', with: 'not_eq_password'
          click_button '登録する'
          expect(page).to have_content 'ユーザー登録に失敗しました'
          expect(page).to have_content 'パスワード確認とパスワードの入力が一致しません'
          expect(current_path).to eq new_user_path
        end
      end
    end
    describe 'マイページ' do
      it 'マイページへのアクセスが失敗する' do
        visit profile_path
        expect(page).to have_content 'ログインしてください'
        expect(current_path).to eq login_path
      end
    end
    describe 'オコゴト画像作成' do
      it 'オコゴト画像作成ページへのアクセスが失敗する' do
        visit new_okogoto_image_path
        expect(page).to have_content 'ログインしてください'
        expect(current_path).to eq login_path
      end
    end
  end

  describe 'ログイン後' do
    let!(:login_user){ create(:user) }
    before{ login(login_user) }
    describe 'マイページ' do
      it 'マイページへアクセスできる' do
        find('#header-menu').click
        click_link 'マイページ'
        expect(page).to have_content 'マイページ'
        expect(page).to have_content login_user.name
        expect(page).to have_content login_user.age_i18n
        expect(page).to have_content login_user.gender_i18n
        expect(current_path).to eq profile_path
      end
    end
    describe 'プロフィール編集' do
      before do
        find('#header-menu').click
        click_link 'マイページ'
        click_link 'プロフィールを編集する'
      end
      context 'フォームの入力値が正常' do
        it 'ユーザー情報の編集が成功する' do
          fill_in 'ニックネーム', with: 'new_name'
          select '秘密', from: '年代'
          choose 'その他'
          click_button 'プロフィールを更新する'
          expect(page).to have_content 'プロフィールを更新しました'
          expect(page).to have_content 'new_name'
          expect(page).to have_content '秘密'
          expect(page).to have_content 'その他'
          expect(current_path).to eq profile_path
        end
      end
      context 'ニックネームが未入力' do
        it 'ユーザー情報の編集が失敗する' do
          fill_in 'ニックネーム', with: nil
          select '30代', from: '年代'
          choose 'その他'
          click_button 'プロフィールを更新する'
          expect(page).to have_content 'プロフィールの更新に失敗しました'
          expect(page).to have_content 'ニックネームを入力してください'
          expect(page).to have_field 'ニックネーム', with: ''
          expect(page).to have_select('年代', selected: '30代')
          expect(page).to have_checked_field('その他')
          expect(current_path).to eq edit_profile_path
        end
      end
    end
    describe 'オコゴト画像作成' do
      it 'オコゴト画像作成ページへアクセスできる' do
        find('#header-menu').click
        click_link 'オコゴト画像を作成する'
        expect(page).to have_content 'オコゴト画像を作成'
        sleep 0.5
        expect(current_path).to eq new_okogoto_image_path
      end
    end
  end
end
