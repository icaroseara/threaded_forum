require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "ActiveModel validations" do
    it { expect(validate_presence_of(:subject))}
  end

  describe "ActiveRecord validations" do
    it { expect(have_many(:comment)) }
  end
end
