require 'rails_helper'

RSpec.describe User, type: :model do
  
  it "is valid with name,email && password == password_confirmation" do
    expect(FactoryBot.create(:user)).to be_valid
  end
  
  it "is invalid without name " do
    expect(FactoryBot.build(:user, name: "")).not_to be_valid 
  end

  it "is invalid with name more than 50 characters" do
    expect(FactoryBot.build(:user, name: "a" * 51)).not_to be_valid
  end

  it "is invalid without email" do
    expect(FactoryBot.build(:user, email: "")).not_to be_valid
  end

  it "is invalid with duplicate email" do
    user1 = FactoryBot.create(:user,name: "taro", email: "taro@example.com")
    expect(FactoryBot.build(:user, name: "ziro", email: user1.email)).not_to be_valid
  end

  it "saves email as lowercase" do
    user1 = FactoryBot.create(:user, email: "Taro@ExAMPle.CoM")
    expect(user1.email).to eq "taro@example.com"
  end
  
  it "is invalid with email more than 255 characters" do
    expect(FactoryBot.build(:user, email: "a" * 255 + "@example.com")).not_to be_valid
  end
  
  it "is invalid with email against the format" do
    expect(FactoryBot.build(:user, email: "user@example,com")).not_to be_valid
    expect(FactoryBot.build(:user, email: "user_at_foo.org")).not_to be_valid
    expect(FactoryBot.build(:user, email: "user.name@example.")).not_to be_valid
    expect(FactoryBot.build(:user, email: "foo@bar_baz.com")).not_to be_valid
    expect(FactoryBot.build(:user, email: "foo@bar+baz.com")).not_to be_valid
  end
  
  it "is invalid without password"  do
    expect(FactoryBot.build(:user, password: "")).not_to be_valid
  end

  it "is invalid with password 6 to 128 characters" do
    expect(FactoryBot.build(:user, password: "12345")).not_to be_valid
    expect(FactoryBot.build(:user, password: "1" * 129)).not_to be_valid
  end
  
  # it "他ユーザーの投稿動画が編集･削除できた場合、無効" do
  
  #remenberMeテスト
  
end
