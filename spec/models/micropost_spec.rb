require 'rails_helper'

RSpec.describe Micropost, type: :model do
  describe "micropost" do
    let(:user) { create(:user) }

    it "is valid with user_id, content" do
      micropost = user.microposts.build(content: "aaaa")
      expect(micropost).to be_valid
    end

    it "is invalid with no content" do
      micropost = user.microposts.build(content: " ")
      expect(micropost).not_to be_valid
    end

    it "is invalid with no user_id" do
      micropost = Micropost.new(content: "aaaa")
      expect(micropost).not_to be_valid
    end
  end

  describe "micropost order" do
    let!(:user) { create(:user) }
    let!(:new_post) { create(:micropost, :today, user: user) }
    let!(:old_post) { create(:micropost, :yesterday, user: user) }

    it "is descending" do
      expect(user.microposts).to eq [new_post, old_post]
    end
  end
end
