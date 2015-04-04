require 'rails_helper'

RSpec.describe Services::Comments::CreateService do  
  let(:topic) { FactoryGirl.create(:post)}
  let(:parent) { FactoryGirl.create(:comment)}
  
  describe "#valid?" do  
    describe "add the first comment" do
      it "with required params" do
        service = Services::Comments::CreateService.new(body: Faker::Lorem.paragraph, post_id: topic.id)
        expect(service.is_valid?).to be_truthy
      end
      
      it "without body" do
        service = Services::Comments::CreateService.new(post_id: topic.id)
        expect(service.is_valid?).to be_falsey
      end
      
      it "without post_id" do
        service = Services::Comments::CreateService.new(body: Faker::Lorem.paragraph)
        expect(service.is_valid?).to be_falsey
      end
    end
    
    describe "add others comments" do
      it "with required params" do
        service = Services::Comments::CreateService.new(body: Faker::Lorem.paragraph, parent_id: parent.id)
        expect(service.is_valid?).to be_truthy
      end
      
      it "without body" do
        service = Services::Comments::CreateService.new(parent_id: parent.id)
        expect(service.is_valid?).to be_falsey
      end
      
      it "without parent_id" do
        service = Services::Comments::CreateService.new(body: Faker::Lorem.paragraph)
        expect(service.is_valid?).to be_falsey
      end
    end
  end
  
  describe "#call" do
    describe "create the first comment" do
      it "with required params" do
        service = Services::Comments::CreateService.new(body: Faker::Lorem.paragraph, post_id: topic.id)
        expect(service.is_valid?).to be_truthy
        expect(service.call).to be_truthy
      end
      
      it "without body" do
        service = Services::Comments::CreateService.new(post_id: topic.id)
        expect(service.is_valid?).to be_falsey
        expect(service.call).to be_falsey
      end
      
      it "without post_id" do
        service = Services::Comments::CreateService.new(body: Faker::Lorem.paragraph)
        expect(service.is_valid?).to be_falsey
        expect(service.call).to be_falsey
      end
    end
    
    describe "create others comments" do
      it "with required params" do
        service = Services::Comments::CreateService.new(body: Faker::Lorem.paragraph, parent_id: parent.id)
        expect(service.is_valid?).to be_truthy
        expect(service.call).to be_truthy
      end
      
      it "without body" do
        service = Services::Comments::CreateService.new(parent_id: parent.id)
        expect(service.is_valid?).to be_falsey
        expect(service.call).to be_falsey
      end

      it "without parent_id" do
        service = Services::Comments::CreateService.new(body: Faker::Lorem.paragraph)
        expect(service.is_valid?).to be_falsey
        expect(service.call).to be_falsey
      end
    end
  end
end
