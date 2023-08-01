トレーニング投稿サイト

URL
https://sheltered-waters-57153-72235aa359f9.herokuapp.com

概要
このサイトは、トレーニングに関する情報を投稿し、ユーザー間でトレーニングの成果を共有できます。

主な機能
ユーザー登録・ログイン: ユーザーはアカウントを作成し、ログインしてアプリを利用できます。(devise)
トレーニング投稿: ユーザーはトレーニングに関する投稿を作成できます。投稿にはトレーニングの内容、成果、鍛えた部位などを含めることができます。
いいね機能: ユーザーは他の投稿に対していいねをすることができます。
検索機能: ユーザーはキーワード(トレーニング内容、トレーニング部位)で投稿を検索できます。
人気のトレーニング投稿: いいねが多い人気のトレーニング投稿を閲覧できます。
商品の検索機能:他の人の投稿を見ておすすめの器具やプロテインの検索をすることができます。

技術スタック
Ruby on Rails フレームワークを使用しています。
フロントエンドには HTML, CSS, JavaScript を使用しています。
データベースには PostgreSQL を使用しています。
ユーザー認証には Devise gem を使用しています。
画像アップロードには CarrierWave gem を使用しています。

テスト
Rspec
model,requests テストの実装

使用技術
Rails 6.1.7.4
ruby 3.1.3
psql (PostgreSQL) 14.8 (Homebrew)
sqlite3 3.36.0
yarn 1.22.19
Rspec
rubocop
RakutenWebService

[erd.pdf](https://github.com/tomoya-takahashi1/myapp110/files/12212797/erd.pdf)

![スクリーンショット 2023-07-31 17 12 30](https://github.com/tomoya-takahashi1/myapp110/assets/123609557/e0ba108a-dbc5-4d71-ad63-9a814e2493a1)
