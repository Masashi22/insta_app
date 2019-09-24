require 'rails_helper'

RSpec.feature "micropost", :devise do
  before do
    @user = create(:user)
  end

  scenario "successfully" do
    login(@user)
    expect(current_path).to eq user_path(@user)
    fill_in "textarea1", with: "sample text"
    expect { click_on "Post" }.to change { Micropost.count }.by(1)
    expect(page).to have_content('sample text')
  end
end
