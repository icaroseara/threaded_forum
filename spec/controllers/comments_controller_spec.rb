require 'rails_helper'

RSpec.describe CommentsController do
  describe "GET new" do
    context "when parent_id is given" do
      let(:parent) { FactoryGirl.create(:comment) }
      let(:new_request) { get :new, parent_id: parent.id, prefix: '/comments'}
      
      it "has a 200 status code" do    
        new_request
        expect(response).to have_http_status(:success)      
      end
    end

    context "when post_id is given" do
      let(:post) { FactoryGirl.create(:post) }
      let(:new_request) { get :new, post_id: post.id, prefix: '/reply'}
      
      it "has a 200 status code" do    
        new_request
        expect(response).to have_http_status(:success)      
      end
    end
  end

  describe "POST create" do    
    describe "using post_id as parent" do  
      let(:parent) { FactoryGirl.create(:post) }
      let(:request_params) { { comment: { body: Faker::Lorem.paragraph, post_id: parent.id } } }
      let(:post_request) { post :create, request_params }
        
      context "when body is available" do
        it do
          post_request
          expect(response).to have_http_status(302) 
          expect(response).to redirect_to("/posts/#{parent.id}")
        end
      end
    
      context "when body isn't available" do
        it do
          request_params[:comment].delete(:body)
          post_request
          expect(response).to have_http_status(422)
        end
      end
    end
    
    describe "using parent_id as parent" do  
      let(:parent) { FactoryGirl.create(:comment) }
      let(:request_params) { { comment: { body: Faker::Lorem.paragraph, parent_id: parent.id, post_id: parent.post.id } } }
      let(:post_request) { post :create, request_params }
      
      context "when body is available" do
        it do
          post_request
          expect(response).to have_http_status(302) 
          expect(response).to redirect_to("/posts/#{parent.post.id}")
        end
      end
    
      context "when body isn't available" do
        it do
          request_params[:comment].delete(:body)
          post_request
          expect(response).to have_http_status(422)
        end
      end
    end
    
    describe "without parent information" do  
      let(:parent) { FactoryGirl.create(:comment) }
      let(:request_params) { { comment: { body: Faker::Lorem.paragraph } } }
      let(:post_request) { post :create, request_params }
      
      it do
        post_request
        expect(response).to have_http_status(422) 
      end
    end
  end
end