require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validationチェック" do
    context "有効な条件" do
      it ":provider, :uid, :nameがあれば有効なこと" do
        expect(User.new(provider: "test", uid: rand(1..300000), name: "test")).to be_valid
      end
    end
    context "無効な条件" do
      it ":providerが無ければ無効なこと" do
        user = User.new(provider: "", uid: rand(1..300000), name: "test")
        user.valid?
        expect(user.errors[:provider]).to include("を入力してください")
      end
      it ":uidが無ければ無効なこと" do
        user = User.new(provider: "test", uid: nil, name: "test")
        user.valid?
        expect(user.errors[:uid]).to include("を入力してください")
      end
      it ":nameが無ければ無効なこと" do
        user = User.new(provider: "test", uid: rand(1..300000), name: "")
        user.valid?
        expect(user.errors[:name]).to include("を入力してください")
      end
      it ":uidが重複する時無効なこと" do
        User.create(provider: "test", uid: 1, name: "test")
        user = User.new(provider: "test", uid: 1, name: "test")
        user.valid?
        expect(user.errors[:uid]).to include("はすでに存在します")
      end
    end
  end
  describe "find_or_create_accountの機能" do
    it "登録されていない:uidでログインした時、新しいuserを作成する" do
      hash = {provider: "test", uid: rand(1..300000), info: {name: "test", image: "test"}}
      expect{User.find_or_create_account(hash)}.to change(User, :count).by(1)
    end
    it "登録済みの:uidでログインした時は、userは作成されない" do
      hash = {provider: "test", uid: rand(1..300000), info: {name: "test", image: "test"}}
      User.find_or_create_account(hash)
      expect{User.find_or_create_account(hash)}.to change(User, :count).by(0)
    end
  end
end
