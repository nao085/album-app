# Album-app
画像を投稿してアルバムを作ることができ、共有することができるwebサービスです。
[![Screenshot from Gyazo](https://gyazo.com/11f411f35d89d23657445d4c4a21becc/raw)](https://gyazo.com/11f411f35d89d23657445d4c4a21becc)
# 製作背景
  手軽に日々の思い出などをアルバム化できるようなアプリがあればいいなと思い製作しました。
# リンク
https://pacific-garden-78264.herokuapp.com/

# テストユーザー
ユーザーネーム: テストマン  
メールアドレス: test1@test.com  
パスワード: foobar  
# このサービスでできること
  * 画像を投稿しアルバムを作成できる 
  [![Screenshot from Gyazo](https://gyazo.com/a5fe22c59e740e0f0769c19248337c57/raw)](https://gyazo.com/a5fe22c59e740e0f0769c19248337c57) 
  * 投稿した画像をアルバムをめくるように表示できる  
  ![315754005a50222c65ca7ef60ba5f08f](https://user-images.githubusercontent.com/57151814/79974396-3d9f3a80-84d4-11ea-9afc-e99eb2b11562.gif)
  * コメント機能(非同期)
  * いいね機能(非同期)
  [![Screenshot from Gyazo](https://gyazo.com/0141529b3321ded1dfd931e8567943c1/raw)](https://gyazo.com/0141529b3321ded1dfd931e8567943c1)
  * 検索機能
  [![Screenshot from Gyazo](https://gyazo.com/0dea4d8eeb3fd7e7bd52afcadd13bb20/raw)](https://gyazo.com/0dea4d8eeb3fd7e7bd52afcadd13bb20)
  * ハッシュタグ機能
  [![Screenshot from Gyazo](https://gyazo.com/ad1bd078dcb5b84c4f1608893b8b2f47/raw)](https://gyazo.com/ad1bd078dcb5b84c4f1608893b8b2f47)
  * ユーザーフォロー機能(非同期)
  [![Screenshot from Gyazo](https://gyazo.com/ec50c4798cf4dc18522b9debeed60f7b/raw)](https://gyazo.com/ec50c4798cf4dc18522b9debeed60f7b)
# 工夫したポイント
アルバムをめくるようなアニメーションを表現するためにjQueryのプラグインであるturn.jsを使用しました。
# 使用技術一覧
  * Ruby 2.5.1
  * Ruby on Rails 6.0.2.1
  * haml 2.0.1
  * jquery 4.3.5
  * sass 6.0.0
  * postgresql
  * heroku
  * Github
# 今後追加したい機能
  * 投稿された画像のexif情報の削除
  * 公開範囲の設定機能
  * AWSに切替
# DB設計
## users テーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true, index: true|
|email|string|null: false|
|password|string|null: false|
|avatar|string||

### Association
- has_many :albums
- has_many :comments
- has_many :likes, dependent: :destroy
- has_many :liked_albums, through: :likes, source: :album
- has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
- has_many :following, through: :following_relationships
- has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
- has_many :followers, through: :follower_relationships

## albumsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false,  index: true|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :album_images, dependent: :destroy
- has_many :comments
- has_and_belongs_to_many :hashtags
- has_many :likes
- has_many :liked_users, through: :likes, source: :user

## album_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|album_id|references|null: false, foreign_key: true|

### Association
- belongs_to :album, optional: true

## relationshipsテーブル
|Column|Type|Options|
|------|----|-------|
|follower_id|integer|unique: true, index: true|
|following_id|integer|unique: true, index: true|

### Association
- belongs_to :follower, class_name: "User"
- belongs_to :following, class_name: "User"

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer||
|album_id|integer||
|text|text|null: false|

### Association
- belongs_to :album
- belongs_to :user

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|album_id|references|null: false, foreign_key: true|

### Association
- belongs_to :album
- belongs_to :user

## hashtagsテーブル
|Column|Type|Options|
|------|----|-------|
|hashname|string|unique: true, index: true|

### Association
- has_and_belongs_to_many :albums

## albums_hashtagsテーブル
|Column|Type|Options|
|------|----|-------|
|hashtag_id|references|null: false, foreign_key: true|
|album_id|references|null: false, foreign_key: true|

### Association
- belongs_to :album
- belongs_to :hashtag



