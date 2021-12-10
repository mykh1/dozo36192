# README

## アプリケーション名
「どーぞ」

## アプリケーション概要
手元にあるものを「あげたい人」と「欲しい人」を繋げる社内で使えるリユースアプリケーション。

## 目指した課題解決
「SDGsで身近にできることは？」→「簡単にものを捨ててしまわないこと」 
例えば本１冊。  
捨てるのはもったいないけど、これだけ売りに行くのはめんどくさい。  
しかし会社に行くついでに持って行って、欲しい人に譲るならそれほど手間もかからない。  

## URL

テスト用アカウント  
社内番号  
パスワード  

## 利用方法
### 想定している使用環境
  社員番号があること。  
  社員用メールアドレスがあること。  
  １つの事業所内で使用されること。（リユースを目的としているため送料などが発生しないようにする）  
  事業所内にリユース品の受け渡し場所が設けられていること。  

### 社内管理者
  社員の新規登録をします。  
  社員ユーザーの管理をします。  

### 社員ユーザー
  初期設定のニックネームとパスワードを変更する。  
  あげたい品の「写真」「名前」「説明」「カテゴリー」「ジャンル」「コンディション」を記入し「登録」する。  
  欲しい品を選んで「受け取る」ボタンをクリックする。  
  「受け取る」ボタンがクリックされるとその品物を「登録」した人にメールが自動配信される。  
  「登録」した人は登録品を所定の場所に持って行った後、「完了」ボタンをクリックする 。 
  「受け取る」人に配送完了メールが自動配信される。  
  「受け取る」人は所定の場所で品物を受け取り「ありがとう」ボタンをクリックすると、登録品に「ありがとう」が表示される。  



## users テーブル

| Column              | Type   | Options                    |
| ------------------- | ------ | -------------------------- |
| employee_number     | string | null: false, unique: true  |
| last_name           | string | null: false                |
| first_name          | string | null: false                |
| last_name_reading   | string | null: false                |
| first_name_reading  | string | null: false                |
| nickname            | string | null: false, unique: true  |
| email               | string | null: false, unique: true  |
| encrypted_password  | string | null: false                |



### Association

- has_many : items
- has_many : orders


## items テーブル

| Column              | Type          | Options                        |
| ------------------- | ------------- | ------------------------------ |
| name                | string        | null: false                    |
| description         | text          | null: false                    |
| category_id         | integer       | null: false                    |
| genre_id            | integer       | null: false                    |
| condition_id        | integer       | null: false                    |
| user                | references    | null: false, foreign_key: true |

### Association
- has_one : order
- belongs_to : user


## orders テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association
- belongs_to : user
- belongs_to : item
