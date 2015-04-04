require 'rails_helper'

RSpec.describe Services::Posts::CreateService do
  describe "#valid?" do
    it "with required params" do
      service = Services::Posts::CreateService.new({ subject: Faker::Lorem.sentence})
      expect(service.is_valid?).to be_truthy
    end
    
    it "without subject" do
      service = Services::Posts::CreateService.new()
      expect(service.is_valid?).to be_falsey
    end
  end
  
  describe "#call" do
    it  do
      service = Services::Posts::CreateService.new({ subject: Faker::Lorem.sentence})
      expect(service.is_valid?).to be_truthy
      expect(service.call).to be_truthy
    end
  end
end
