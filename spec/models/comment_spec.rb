require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "ActiveModel validations" do
    it { expect(validate_presence_of(:body))}
  end

  describe "ActiveRecord validations" do
    it { expect(belong_to(:post)) }
  end
end
