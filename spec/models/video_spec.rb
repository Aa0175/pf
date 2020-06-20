require 'rails_helper'

RSpec.describe Video, type: :model do
  
  it "is valid with title、tag_list && youtube_url more than 11 characters" do
    expect(FactoryBot.create(:video)).to be_valid
  end
  
  it "is invalid without user_id" do
    expect(FactoryBot.build(:video, user_id: "")).not_to be_valid
  end
  
  it "is invalid with title more than 50 characters" do
    expect(FactoryBot.build(:video, title: "a" * 51)).not_to be_valid
  end
  
  
  # it "tagの文字数が?文字以上の場合、無効" do
  #   expect(FactoryBot.build(:video, user_id: "")).not_to be_valid
  # end
  
  # it "videoが投稿日時順に表示されれば、有効" do　←コントローラーテスト？
  #   dummyVideos = create_list(:video, 3)
  #   get :index
  #   expect(assigns(:videos)).to match(dummyVideos.sort{|a, b| b.created_at <=> a.created_at})
  # end
end
