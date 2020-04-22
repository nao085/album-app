# Album-app
画像を投稿してアルバムを作ることができ、共有することができるwebサービスです。
[![Screenshot from Gyazo](https://gyazo.com/b5ca85cb86fcdcf2d3fb0d1d8bf35df3/raw)](https://gyazo.com/b5ca85cb86fcdcf2d3fb0d1d8bf35df3)
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
  [![Screenshot from Gyazo](https://gyazo.com/0c3c2308f1eda50eeb2b578039d7c635/raw)](https://gyazo.com/0c3c2308f1eda50eeb2b578039d7c635)  
  * 投稿した画像をアルバムをめくるように表示できる  
  [![Screenshot from Gyazo](https://gyazo.com/315754005a50222c65ca7ef60ba5f08f/raw)](https://gyazo.com/315754005a50222c65ca7ef60ba5f08f)

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

## albumsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :album_images, dependent: :destroy

## album_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|album_id|references|null: false, foreign_key: true|

### Association
- belongs_to :album, optional: true
