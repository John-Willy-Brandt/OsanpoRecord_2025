class MypagesController < ApplicationController
  before_action :authenticate_user!   # ログインしていない人はマイページを見られない

  def show
    @user = current_user

    # ログインユーザーのツイートだけ全部取得（古い順 or 新しい順はお好みで）
    @tweets = @user.tweets.order(activity_date: :asc)

    # カレンダー用に日付だけの配列を持っておく
    @activity_dates = @tweets.pluck(:activity_date)
  end
end
