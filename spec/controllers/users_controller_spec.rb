require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #show" do
    let!(:user)       { FactoryBot.create(:user, id: "1") }
    let!(:other_user) { FactoryBot.create(:other_user, id: "9999") }
    let!(:video) { FactoryBot.create(:video, user_id: user.id) }
    let!(:video2) { FactoryBot.create(:video, user_id: other_user.id) }
    
    context "with login" do
      before do
        login user
      end
  
      it "renders the :show template" do
        get :show, params: { id: user.id }
        expect(response).to render_template(:show)
      end  
      
      it "has only videos with login user_id" do
        get :show, params: { id: user.id }
        expect(assigns(:videos)).to contain_exactly(video)
        expect(assigns(:videos)).not_to include(video2)
      end
      
      it "does not render the :show template with other_user_id" do
        get :show, params: { id: other_user.id }
        expect(response).to redirect_to(root_url)
      end
    end

    context "without login" do
      it "renders videos#index template with existing user_id" do
        get :show, params: { id: user.id }
        expect(response).to redirect_to(root_url)
      end
      
      it "renders videos#index template with Nonexisting user_id" do
        get :show, params: { id: "123"}
        expect(response).to redirect_to(root_url)
      end
    end
  end
end