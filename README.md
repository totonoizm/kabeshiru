# KABESHIRU

## 概要

クライミングジム検索、レビュー、トレーニング記録シェアサービス。

### URL
http://kabeshiru.work

### サイトテーマ
初めていくジムがどんな雰囲気なのかわからず、気後れしてしまうことありませんか？
ジムに行く前にKABESHIRUで検索すれば先輩クライマーのジムレビューが確認できます！
ジムの雰囲気を掴んで、ボルダリングをエンジョイ！
また、今日はどのジムでどれだけ登ったか、今日完登できなかった課題はどれか・・・
など、自分のトレーニング記録（ノボログ）もつけられます。
今日がんばった分、明日はもっと高く登れる！
KABESHIRUはクライマーライフをちょっぴり豊かにするサイトです。

### テーマを選んだ理由
ボルダリング愛好者としては、初めて行くジムがどのくらいの難易度なのか、どんな雰囲気なのかわかりにくく、
実際の利用者の声もきけず、行くのをやめてしまう事もありました。

行きたいジムが出てきてもどのくらいの難易度なのか、雰囲気はどんな感じなのかわかりにくく行くのを躊躇うことがあった。
ジム毎にユーザーのコメントを残せるようにしてレビューを集め、どんな雰囲気なのか実際の声がわかるサービスを作りたい。
また、レビューだけではなく、そのジムでどれだけ登ったかなど、自分のトレーニング記録の管理も同時にできたら、という思いから
てオンラインで管理、シェアできるサービスを目指しました。

### ターゲットユーザ

ジムクライマー。ボルダリングに興味のある人。
ボルダリングを始めたい初心者から遠征もするような愛好者まで

### 主な利用シーン

旅先や近場の行ってみたいジムを探す時に。
ジムの雰囲気、難易度をひと目で知りたい時に。
そのジムで登った回数や感想、登ったコースなど、自分のトレーニング記録を残したいときに。

### 機能一覧
・ジム登録機能
・コメント機能
・ジム検索機能
    登録されたジム
・マップ表示（Google map API,Geocording APIを使用して、登録した住所からマップを表示）
・画像投稿機能

https://docs.google.com/spreadsheets/d/11c-3oiSjkGZnU5FRC_Zv4oIA_uMa5Geq6-eNhcV56os/edit?usp=sharing

##環境・使用技術

### 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL,Bootstrap4.5.0
- フレームワーク：Ruby on Rails
- JS ライブラリ：jQuery
- IDE：Cloud9

### 本番環境
　AWS (EC2,RDS for MySQL,AWS (EC２,RDS for MySQL,Route53）
　MySQL2
　Nginnx,Puma
　GitHub Actionを使用した自動デプロイ
###　テスト
　Rspec
###その他使用技術
　非同期通信（ユーザー投稿、削除、ブックマークボタンの即時反映）
　外部API （Google MapAPI,Geocording API)
　
