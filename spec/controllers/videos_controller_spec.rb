require 'rails_helper'

RSpec.describe VideosController, type: :controller do
  let!(:user)       { FactoryBot.create(:user, id: "1") }
  let!(:other_user) { FactoryBot.create(:other_user, id: "9999") }
  let!(:video) { FactoryBot.create(:video, user_id: user.id) }
  let!(:video2) { FactoryBot.create(:video, user_id: other_user.id) }
  
  describe "GET #index" do
    it "renders the :index template and all videos" do
      get :index
      expect(assigns(:videos)).to contain_exactly(video, video2)
    end
  end
  
  describe "with login" do
    before do
        login user
    end
    
    describe "when creating and saving a new video" do
      it "GET #new" do
        get :new
      end
    
      it "POST #create" do
      
      end
    end
  
    describe "get #show" do
    
    end
  
    describe "get #edit" do
    
    end
  
    describe "delete #destroy" do
    
    end
  
    describe "get #update" do
    
    end
  end
  
  describe "without login" do
    
  end
end
