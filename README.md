# ぱぱぷれびゅー(papa present review)
[![Image from Gyazo](https://i.gyazo.com/6d2c7d3186fc39da04b11296e36aea49.png)](https://gyazo.com/6d2c7d3186fc39da04b11296e36aea49)
​
## サイト概要
### サイトテーマ
パパさん宛ての出産祝いを贈りたい人が集まって、購入を悩んでいる商品について検索したり、おすすめのプレゼントを紹介し合えるレビューサイト。

### テーマを選んだ理由
ママ向けの出産祝いは多くのサイトで紹介されているから探しやすいけれど、男性向けのプレゼントについて紹介しているサイトがあまりなく、何を買えばいいのか頭を悩ませていました。<br>
機能面の違いや使用感、金額、トータルの満足感など、PRを含まなず忌憚のない実際に使用したパパ目線の声をまとめて見れるサイトがあれば便利だと考えました。<br>
また、自分の子どもに購入する商品選びの助けにもなると考えてこのテーマにしました。

### ターゲットユーザー
家族、友人に子どもが生まれたが、どんなものをプレゼントしてあげればいいか分からない人<br>
パパも一緒に子育て頑張ろうという意味合いでパパが喜ぶ商品を買いたいママ<br>
初めての子育てでどんなものを買ってあげたらいいかわからないパパ

### 主な利用シーン
【投稿者】<br>
自分が購入したおもちゃの使用感を共有する時<br>
<br>
【閲覧者】<br>
出産祝い、誕生祝いなど各種イベントでプレゼントを選びたい時<br>
購入を検討しているおもちゃのレビューを見たい時<br>

## 実装予定の機能
【すべてのユーザー】
- トップページ、Aboutページ
- 投稿一覧、詳細
- 商品カテゴリ別投稿検索

【登録ユーザーのみ】
- 新規投稿作成
  - 投稿の公開、非公開設定
- 投稿を評価
  - いいね、投稿に対するコメント
- いいねした投稿の一覧表示
- 検索機能
  - ユーザーor投稿のキーワード検索、タグ検索
- ソート機能
- マイページの編集
  - 登録情報の変更

【管理ユーザーのみ】
- 登録ユーザーの一覧、詳細、編集
- ジャンルの一覧、追加、編集、削除
- レビューの一覧、削除
- タグの一覧、追加、削除

## 使用方法
__インストール__

$ git clone [https://github.com/tomotomo11/papa_preview/](https://github.com/tomotomo11/papa_preview/)<br>
$ cd papa_preview<br>
$ bundle install<br>
$ rails db:migrate<br>
$ rails db:seed<br>
$ rails s<br>

__テスト__

ターミナル（もしくはコマンドプロンプト）で上記の作業を実施後、ローカルサーバーでご確認ください。

```
【管理者用アカウント】
URL：/admin/sign_in
メールアドレス：admin@admin
パスワード：testpass
```
```
【顧客用アカウント】
ゲストログインからご確認いただけます。
（新規会員登録画面にて新規登録も可能です。）
```

## 設計書
### 画面遷移図
ワイヤーフレームは[こちら](https://www.figma.com/design/48ActQj4uBZE7dFgehPHGU/%E3%83%9D%E3%83%BC%E3%83%88%E3%83%95%E3%82%A9%E3%83%AA%E3%82%AA?node-id=0-1&t=x2RjptCozGrAnJDp-0)

### ER図
[![Image from Gyazo](https://i.gyazo.com/59e18734c3fa2995ec9299d77158a87a.png)](https://gyazo.com/59e18734c3fa2995ec9299d77158a87a)

### AWS構成図
[![Image from Gyazo](https://i.gyazo.com/4ced22d4d7168cfd2577af2229a28029.png)](https://gyazo.com/4ced22d4d7168cfd2577af2229a28029)

### サイトURL
URLは[こちら](http://54.95.246.32/)
​
## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9

## Gem
 - bootstrap
 - devise
 - jquery-rails
 - kaminari
 - enum_help

## Git運用ルール

__ブランチについて__

- mainブランチは常にリリース（デプロイ）できるような状態にある
- developブランチを統合ブランチとする
- トピックブランチは全てdevelopブランチから派生させる

|ブランチ名       |役割                      |派生元  |マージ先  |
|----------------|-------------------------|-------|---------|
|main            |公開するものを置くブランチ  |        |　       |
|develop         |開発中のものを置くブランチ  |main    |main     |
|feature/*       |機能追加中に使うブランチ    |develop |develop  |

## 使用素材
- フリー素材として以下を使用<br>
・フォトAC（https://www.photo-ac.com/）<br>
