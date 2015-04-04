require 'rails_helper'

RSpec.describe PostsController do
  describe "GET index" do
    let(:index_request) { get :index, {} }
    
    it "has a 200 status code" do
      index_request
      expect(response).to have_http_status(:success)      
    end
    
    it "redirect view" do
      index_request
      expect(response).to render_template("index")
    end
  end

  describe "GET show" do
    let(:post) { FactoryGirl.create(:post) }
    let(:show_request) { get :show, id: post.id }

    it "has a 200 status code" do    
      show_request
      expect(response).to have_http_status(:success)      
    end
    
    it "redirect view" do
      show_request
      expect(response).to render_template("show")
    end
  end

  describe "POST create" do
    let(:request_params) { { post: { subject: Faker::Lorem.sentence } } }
    let(:post_request) { post :create, request_params }
    
    context "when subject is available" do
      it do
        post_request
        expect(response).to have_http_status(302)    
        expect(response).to redirect_to(assigns(:post))
      end
    end
    
    context "when subject isn't available" do
      it do
        request_params[:post].delete(:subject)
        post_request
        expect(response).to have_http_status(422)
      end
    end
  end
end