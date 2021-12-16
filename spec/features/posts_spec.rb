require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  scenario "ゲストユーザーとして掲示板に投稿する。", js: true do
    visit root_path
    expect {
      fill_in "post_content", with: "test content"
      click_button "新規投稿"
    }.to change(Post, :count).by(1)
  end

  scenario "ログインして掲示板に投稿し、削除する。", js: true do
    visit root_path
    click_link "ログイン"
    expect(page).to have_content "ログインしました。"

    expect {
      fill_in "post_content", with: "test content"
      click_button "新規投稿"
    }.to change(Post, :count).by(1)

    expect {
      click_link "削除"
      expect(page).to have_content "投稿を削除しました。"
    }.to change(Post, :count).by(-1)
  end

  scenario "ログインして掲示板に投稿し、別アカウントでログインすると削除できない。", js: true do
    visit root_path
    click_link "ログイン"
    expect(page).to have_content "ログインしました。"

    expect {
      fill_in "post_content", with: "test content"
      click_button "新規投稿"
    }.to change(Post, :count).by(1)

    click_link "ログアウト"
    expect(page).to have_content "ログアウトしました。"

    expect(page).to have_no_content "削除"
  end
end
