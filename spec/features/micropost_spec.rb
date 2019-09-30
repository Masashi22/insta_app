require 'rails_helper'

RSpec.feature "micropost", :devise do
  before do
    @user = create(:user)
  end

  scenario "create successfully & destroy" do
    login(@user)
    expect(current_path).to eq user_path(@user)
    fill_in "textarea1", with: "sample text"
    page.attach_file("app/assets/images/sample.png") do
      page.find('#picture_sub').click
    end
    expect { click_on "Post" }.to change { Micropost.count }.by(1)
    expect(current_path).to eq user_path(@user)
    click_on "main_image"
    expect { click_on "delete" }.to change { Micropost.count }.by(-1)
  end

  scenario "create fail because content is blank" do
    login(@user)
    expect(current_path).to eq user_path(@user)
    fill_in "textarea1", with: " "
    click_on "Post"
    expect(current_path).to eq microposts_path
  end
end
