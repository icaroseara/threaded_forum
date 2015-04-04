require 'rails_helper'

RSpec.describe Services::Comments::ShowService do  
  let(:parent) { FactoryGirl.create(:comment)}
  let(:topic) { FactoryGirl.create(:post)}
  
  describe "#valid?" do 
    describe "post without comments" do
      it "with required params" do
        service = Services::Comments::ShowService.new( post: topic)
        expect(service.is_valid?).to be_truthy
      end
    
      it "without post" do
        service = Services::Comments::ShowService.new()
        expect(service.is_valid?).to be_falsey
      end
    end
    
    describe "post with comments" do
      it "with required params" do
        service = Services::Comments::ShowService.new( post: parent)
        expect(service.is_valid?).to be_truthy
      end
    
      it "without post" do
        service = Services::Comments::ShowService.new()
        expect(service.is_valid?).to be_falsey
      end
    end
  end
  
  describe "#call" do
    let(:post_with_comments){ FactoryGirl.create(:post_with_comments) }
    describe "post without comments" do
      it "with required params" do
        service = Services::Comments::ShowService.new( post: post_with_comments)
        expect(service.is_valid?).to be_truthy
        expect(service.call).to be_truthy
      end
    
      it "without post" do
        service = Services::Comments::ShowService.new()
        expect(service.is_valid?).to be_falsey
        expect(service.call).to be_falsey
      end
    end
    
    describe "post with comments" do
      describe "with pagination" do
        it "with required params" do
          service = Services::Comments::ShowService.new( post: post_with_comments, page: 1)
          expect(service.is_valid?).to be_truthy
          expect(service.call).to be_truthy
          expect(service.call.count).to eq(10)
        end
      end
      
      describe "without pagination" do
        it "with required params" do
          service = Services::Comments::ShowService.new( post: post_with_comments)
          expect(service.is_valid?).to be_truthy
          expect(service.call).to be_truthy
          expect(service.call.count).to eq(10)
        end
      end
    end
  end
end
