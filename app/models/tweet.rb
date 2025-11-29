class Tweet < ApplicationRecord
  # あとで User モデルを作ったら有効にする
  # belongs_to :user

  # 簡単なバリデーション（あとで増やせます）
  validates :subject,       presence: true
  validates :text,          presence: true
  validates :category_id,   presence: true
  validates :duration_id,   presence: true
  validates :intensity_id,  presence: true
  validates :rating_id,     presence: true
  validates :activity_date, presence: true
end
