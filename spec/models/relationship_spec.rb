require 'rails_helper'

RSpec.describe Relationship, type: :model do
  describe "follow & unfollow" do
    let(:user) { create(:user) }
    let(:other_user) { create(:user) }

    it "follow" do
      user.follow(other_user)
      expect(user.following.count).to eq 1
    end

    it "unfollow" do
      user.follow(other_user)
      expect(user.following.count).to eq 1
      user.unfollow(other_user)
      expect(user.following.count).to eq 0
    end

    it "following?" do
      user.follow(other_user)
      expect(user.following.count).to eq 1
      expect(user.following?(other_user)).to eq true
    end
  end
end
