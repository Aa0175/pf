require 'rails_helper'

RSpec.describe VideosController, type: :controller do
  let!(:user)       { FactoryBot.create(:user, id: "1") }
  let!(:other_user) { FactoryBot.create(:other_user, id: "9999") }
  let!(:video) { FactoryBot.create(:video, id: "1", user_id: user.id) }
  let!(:video2) { FactoryBot.create(:video, user_id: other_user.id) }
  
  describe "GET #index" do
    it "renders the :index template and all videos" do
      get :index
      expect(response).to be_successful
      expect(response).to have_http_status "200"
      expect(assigns(:videos)).to contain_exactly(video, video2)
    end
  end
  
  it "GET #show" do
      expect(
        get :show, params: { id: video.id }
        ).to render_template(:show, id: assigns(:video).id )
  end
  
  describe "with login" do
    before do
        login user
    end
    
    describe "when creating and saving a new video" do
      it "GET #new" do
        get :new
        expect(response).to render_template(:new)
      end
    
      it "POST #create" do
        post_params = FactoryBot.attributes_for(:video)
        expect{
        post :create, params: { video: post_params }
        }.to change(user.videos, :count).by(1)
        expect(response).to redirect_to(assigns(:video))
      end
    end
  
    it "GET #edit" do
      expect(
        get :edit, params: { id: video.id }
        ).to render_template(:edit, id: assigns(:video).id )
    end
  
    describe "when updating or destroying" do
      before do
        get :edit, params: { id: video.id }
      end
      
      it "PATCH #update" do
        patch :update, params: { id: video.id, "video"=>{ title: "Updateテスト", tag_list: "Updated" } }
        expect(assigns(:video).title).to eq("Updateテスト")
        expect(assigns(:video).tag_list).to contain_exactly("Updated")
      end
  
      it "DELETE #destroy" do
        expect{
        delete :destroy, params: { id: video.id }
        }.to change(user.videos, :count).by(-1)
        expect(response).to redirect_to("/users/1")
      end
    end
  end
  
  describe "without login" do
    it "GET #new" do
      get :new
      expect(response).to redirect_to("/users/sign_in")
    end
    
    it "GET #edit" do
      get :edit, params: { id: video.id }
      expect(response).to redirect_to("/users/sign_in")
    end
  end
end
