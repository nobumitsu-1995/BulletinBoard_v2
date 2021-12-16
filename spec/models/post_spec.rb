require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "validationチェック" do
    context "有効な条件" do
      it ":contentがあれば有効なこと" do
        expect(Post.create(content: "test")).to be_valid
      end
      it ":contentが200字の時、有効なこと" do
        expect(Post.create(content: "a" * 200)).to be_valid
      end
    end
    context "無効な条件" do
      it ":contentが無ければ無効なこと" do
        post = Post.new(content: "")
        post.valid?
        expect(post.errors[:content]).to include("を入力してください")
      end
      it ":contentが201字の時無効なこと" do
        post = Post.new(content: "a" * 201)
        post.valid?
        expect(post.errors[:content]).to include("は200文字以内で入力してください")
      end
    end
  end  
end
