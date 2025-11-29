# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation
* Database creation
# Table
## Table: users
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| family_name_kana   | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | date   | null: false |

class User < ApplicationRecord
  has_many :tweets, dependent: :destroy
  has_many :comments, dependent: :destroy
end

## Table: tweets

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| subject       | string     | null: false                    | # タイトル
| text          | text       | null: false                    | # 本文
| category_id   | integer    | null: false                    | # ランニング / 散歩 / ジョギング (ActiveHash)
| duration_id   | integer    | null: false                    | # 〜30分, 30〜60分, 60分以上... など ActiveHash
| intensity_id  | integer    | null: false                    | # （任意）強度：ゆっくり / 普通 / きつい
| rating_id     | integer    | null: false                    | # （任意）気分：最高 / 普通 / イマイチ など
| activity_date | date       | null: false                    | # カレンダーの日付
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many_attached :images  # 「some images」に対応
- has_many :comments, dependent: :destroy## Table: comments

## Table: comments

| Column | Type       | Options                         |
| ------ | ---------- | ------------------------------- |
| user   | references | null: false, foreign_key: true |
| tweet  | references | null: false, foreign_key: true |
| text   | text       | null: false                    |

### Association

- belongs_to :tweet
- belongs_to :user


* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
