require 'rails_helper'

RSpec.feature 'follow & unfollow' do
  background do
    @user = create(:user)
    @other_user = create(:user)
  end

  scenario "is successfully" do
    login(@user)
    visit user_path(@other_user)
    expect(page).to have_content @other_user.username
    expect { click_on 'Follow' }.to change { @user.following.count }.by(1)
    expect(@other_user.followers.count).to eq 1
    expect(current_path).to eq user_path(@other_user)
    expect { click_on 'Unfollow' }.to change { @user.following.count }.by(-1)
    expect(@other_user.followers.count).to eq 0
  end
end
