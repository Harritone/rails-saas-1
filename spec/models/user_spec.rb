require 'rails_helper'

RSpec.describe User, type: :model do
  context "valid factory" do
    it "has a valid Factory" do
      expect(FactoryBot.build(:user)).to be_valid 
    end
    
  end

  it { is_expected.to belong_to(:account).optional }
  it { is_expected.to have_many(:team_memberships) }
  it { is_expected.to have_many(:teams).through(:team_memberships) }
  
end
