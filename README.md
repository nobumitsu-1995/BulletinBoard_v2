# BulletinBoard_v2について
本アプリケーションは、Ajax処理を取り入れた掲示板です。APIを利用したログイン機能やAJAX処理、N＋１問題の解決方法といったより実践的な技術について学ぶために作成をしました。ログインをして掲示板に投稿、削除ができ、チャットすることができます。

- [アプリケーションURL](https://ajaxbulletinboard.herokuapp.com/)

## 実装機能について
実装されている機能に関しては以下のようになっています。
- Googleのアカウントを利用したログイン機能。
- 掲示板に投稿、削除をする機能。
- ゲストユーザーによる投稿機能。
- gem「kaminari」を使用したページネーション機能。

## データベース設計について
データベースの設計に関しては以下のER図の通りとなります。

<img width="441" alt="ER" src="./public/images/bulletin_board_ER.png">

## 使用した技術スタック
Bootstrap,　Javascript, Ruby on Rails, PostgreSQL, Heroku, Google API

## 使用している主なgemについて
- Rspec：　Railsの代表的なテストツールの一つ。単体テスト、統合テストを実行するために使用しました。
- Factory Bot：　テストのサンプルデータを簡単に作成することができるgem。
- omniauth-google-oauth2：　google認証機能を使用したログイン機能を実装するためのgem。
- kaminari：　ページネーション機能を作成するためのgem。