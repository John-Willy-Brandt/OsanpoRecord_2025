require "rails_helper"

RSpec.describe Tweet, type: :model do
  describe "バリデーション" do
    it "FactoryBotで作ったtweetは有効である" do
      tweet = build(:tweet)
      expect(tweet).to be_valid
    end

    it "subjectが空だと無効" do
      tweet = build(:tweet, subject: "")
      expect(tweet).to be_invalid
      expect(tweet.errors.full_messages).to include("Subject can't be blank")
    end

    it "textが空だと無効" do
      tweet = build(:tweet, text: "")
      expect(tweet).to be_invalid
      expect(tweet.errors.full_messages).to include("Text can't be blank")
    end

    it "activity_dateが空だと無効" do
      tweet = build(:tweet, activity_date: nil)
      expect(tweet).to be_invalid
      expect(tweet.errors.full_messages).to include("Activity date can't be blank")
    end
  end
end
