class TweetsController < ApplicationController
  # 一覧と詳細ページだけはログインなしで見られるようにする
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @tweets = Tweet.all.order(activity_date: :desc)
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to tweets_path, notice: "おさんぽ記録を保存しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(
      :subject,
      :text,
      :category_id,
      :duration_id,
      :intensity_id,
      :rating_id,
      :activity_date
    ).merge(user_id: current_user.id)
  end
end
