RSpec.describe 'Posts', type: :system do
  let(:post_create_user){ create(:user) }
  before do
    create(:tag, :study)
    create(:tag, :others)
    login(post_create_user)
    find('#header-menu').click
    click_link 'オコゴト画像を作成する'
    find('#okogoto').set('Okogoto')
    choose 'まるで小言な雰囲気'
    click_button 'オコゴト画像を作成する'
  end
  describe '作成した画像投稿に説明を追加' do
    context 'コメントとタグが追加された場合' do
      it '投稿詳細ページに追加されたコメントとタグが表示される' do
        fill_in 'コメント', with: 'comment'
        select '学習', from: 'タグ'
        click_button '説明を追加する'
        expect(page).to have_content 'オコゴト画像に説明を追加しました！'
        expect(page).to have_content 'comment'
        expect(page).to have_link '# 学習'
      end
    end
    context 'コメントのみ追加して、タグを選択しない場合' do
      it '投稿詳細ページに追加したコメントと# オコゴトが表示される' do
        fill_in 'コメント', with: 'comment'
        click_button '説明を追加する'
        expect(page).to have_content 'オコゴト画像に説明を追加しました！'
        expect(page).to have_content 'comment'
        expect(page).to have_link '# オコゴト'
      end
    end
    context 'コメントは追加せずタグのみ追加された場合' do
      it '投稿詳細ページに追加したタグだけが表示される' do
        select '学習', from: 'タグ'
        click_button '説明を追加する'
        expect(page).to have_content 'オコゴト画像に説明を追加しました！'
        expect(page).not_to have_content 'コメント'
        expect(page).to have_link '# 学習'
      end
    end
    context 'タグもコメントも追加されなかった場合' do
      it '# オコゴトのみが表示される' do
        click_button '説明を追加する'
        expect(page).to have_content 'オコゴト画像に説明を追加しました！'
        expect(page).not_to have_content 'コメント'
        expect(page).to have_link '# オコゴト'
      end
    end
  end
  describe '投稿詳細ページ' do
    let(:another_user){ create(:user) }
    before do
      fill_in 'コメント', with: 'comment'
      select '学習', from: 'タグ'
      click_button '説明を追加する'
      sleep 0.5
      find('#header-menu').click
      click_button 'ログアウト'
    end
    context '自分が作成した投稿の場合' do
      before do
        login(post_create_user)
        visit post_path(post_create_user.posts.first)
      end
      it '投稿が編集できる' do
        expect(page).to have_content 'comment'
        expect(page).to have_content '# 学習'
        expect(page).to have_link '投稿を編集する'
      end
      it '投稿が削除できる' do
        expect(page).to have_content 'comment'
        expect(page).to have_content '# 学習'
        expect(page).to have_link '投稿を削除する'
      end
    end
    context '他人が作成した投稿の場合' do
      before do
        login(another_user)
        visit post_path(post_create_user.posts.first)
      end
      it '投稿編集・削除ボタンが表示されない' do
        expect(page).to have_content 'comment'
        expect(page).to have_content '# 学習'
        expect(page).not_to have_link '投稿を編集する'
        expect(page).not_to have_link '投稿を削除する'
      end
    end
  end
end