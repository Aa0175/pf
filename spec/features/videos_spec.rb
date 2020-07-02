require 'rails_helper'

RSpec.feature "Videos", type: :feature do
  #ユーザーは新しいビデオを投稿する
  it "user creates a new video" do
    @user = User.create(
      name:  "tester",
      email: "testtest@gmail.com",
      password:              "123456",
      password_confirmation: "123456"
      )
    
    visit "/"
    click_link "新しく投稿する"
    追加
    
    # fill_in "user_email",    with: @user.email
    # fill_in "user_password", with: @user.password
    # click_button "ログイン"
  
    # expext {
    #   visit new_video_path
    #   fill_in "title", with: "New Video"
    #   fill_in "tag_list", with: "test"
    #   fill_in "youtube_url", with: "https://www.youtube.com/watch?v=1test_test1"
    #   click_button "投稿"
    
    #   expect(page).to have_content "動画を投稿しました"
    # }
  
  # パターン２　ログイン画面
  # アドレスとパスワード入力してログイン
  # トップページにリダイレクト
  # 新規投稿画面表示
  
  
  # タイトル、ＵＲＬ、タグを入力して作成ボタンクリック
  # 作成成功のフラッシュメッセージが表示されること
  # ビデオ詳細画面にリダイレクト
  end
end
