require 'rails_helper'

RSpec.describe Account, type: :model do
  context "valid Factory" do
    it "has a valid Factory" do
      expect(FactoryBot.build(:account)).to be_valid  
    end
  end

  context "valid validation" do
    it "won't save without a name" do
      expect(FactoryBot.build(:account, name: nil).save).to be_falsy 
    end
  end
  
end
