require 'rails_helper'

RSpec.describe Services::Comments::InitializeService do  
  let(:topic) { FactoryGirl.create(:post)}
  let(:parent) { FactoryGirl.create(:comment)}
  
  describe "#valid?" do  
    describe "initialize the first comment" do
      it "with required params" do
        service = Services::Comments::InitializeService.new( post_id: topic.id)
        expect(service.is_valid?).to be_truthy
      end
    
      it "without post_id" do
        service = Services::Comments::InitializeService.new()
        expect(service.is_valid?).to be_falsey
      end
    end
    
    describe "initialize others comments" do
      it "with required params" do
        service = Services::Comments::InitializeService.new( parent_id: parent.id)
        expect(service.is_valid?).to be_truthy
      end
     
      it "without parent_id" do
        service = Services::Comments::InitializeService.new()
        expect(service.is_valid?).to be_falsey
      end
    end
  end
  
  describe "#call" do
    describe "initialize the first comment" do
      it "with required params" do
        service = Services::Comments::InitializeService.new(post_id: topic.id)
        expect(service.is_valid?).to be_truthy
        expect(service.call).to be_truthy
      end
      
      it "without post_id" do
        service = Services::Comments::InitializeService.new()
        expect(service.is_valid?).to be_falsey
        expect(service.call).to be_falsey
      end
    end

    describe "initialize others comments" do
      it "with required params" do
        service = Services::Comments::InitializeService.new(parent_id: parent.id)
        expect(service.is_valid?).to be_truthy
        expect(service.call).to be_truthy
      end

      it "without parent_id" do
        service = Services::Comments::InitializeService.new()
        expect(service.is_valid?).to be_falsey
        expect(service.call).to be_falsey
      end
    end
  end
end
