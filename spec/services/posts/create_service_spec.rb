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
    let(:blacklist) { YAML.load_file(Sauber.blacklist) }
    let(:pronatity_subject) {"#{Faker::Lorem.sentence} - #{blacklist.sample}."}
    
    it  do
      service = Services::Posts::CreateService.new({ subject: Faker::Lorem.sentence})
      expect(service.is_valid?).to be_truthy
      expect(service.call).to be_truthy
    end
    
    it "with profanity filter" do
      service = Services::Posts::CreateService.new({ subject: pronatity_subject})
      expect(service.is_valid?).to be_truthy
      post = service.call
      expect(post).to be_truthy
      expect((post.subject =~ /- \*+/).nil?).to be_falsy
    end
  end
end
