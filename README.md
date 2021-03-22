# README

# アプリケーション名

- Chat Line

# アプリケーション概要

- 個別メッセージとルーム作成してのグループメッセージ機能を備えたチャットアプリ

# URL

- [Chat Line](http://18.176.40.144/)

# テスト用アカウント

- email: satou@gmail.com
- password: passwordsatou

# 利用方法

- ユーザー登録により利用可能
- 個別チャット機能
  - 対象のユーザーを選択するとそのユーザーと1対1でチャットができる
- 複数トーク機能
  - トークルームを作成し、そのルーム内で複数人トークができる
- 検索機能
  - ユーザー名とルーム名で検索ができる
- カレンダー機能
  - 日別のトーク一覧が確認できる

# 目指した課題解決、制作背景

- グループ内のコミュニケーション活性化
- 日別のメッセージがすぐ確認でき、メッセージ日記としても機能できる

# 実装機能

### 基本機能とDEMO
- 個別チャット機能
対象のユーザーを選択するとそのユーザーと1対1で非同期でチャットができる  
![1](https://user-images.githubusercontent.com/74998207/111921823-0b2e0100-8ada-11eb-9ed9-99b68f805424.gif)

- 複数トーク機能
トークルームを作成し、そのルーム内で複数人トークができる  
![2](https://user-images.githubusercontent.com/74998207/111922040-1cc3d880-8adb-11eb-96a6-f4a1831e6f07.gif)

- 検索機能
ユーザー名とルーム名で検索ができる  
![3](https://user-images.githubusercontent.com/74998207/111922279-42051680-8adc-11eb-88a9-33e700c3e06e.gif)

- カレンダー機能
日別のトーク一覧が確認できる  
![4](https://user-images.githubusercontent.com/74998207/111927330-b6977f80-8af3-11eb-84ef-8b9c217aec10.gif)


# 工夫したポイント
- RailsのActionCableを用いた非同期のメッセージ投稿機能
- gemのsimplecalendarを用いた日別のリンク先の作成

# 今後実装したい機能
- ルーム招待機能
- ユーザーのお気に入り機能

# 開発環境

## バックエンド
Ruby,Ruby on Rails

## フロントエンド
HTML,CSS,JavaScript,jQuery,Ajax

## データベース
MySQL

## インフラ
AWS(EC2),Capistrano

## 本番環境
Nginx

## ソース管理
GitHub,GitHubDesktop

## テスト
RSpec

## エディタ
VSCode

# E-R図
![ER](https://user-images.githubusercontent.com/74998207/111901233-0b96af80-8a7a-11eb-9d90-6d27198af399.png)

# テーブル設計

## users テーブル

| Column              | Type     | Options                   |               
| ------------------- | -------- | ------------------------- |
| nickname            | string   | null: false               |
| email               | string   | null: false, unique: true |
| encrypted_password  | string   | null: false               |

### Association

- has_many :chats
- has_many :messages
- has_many :rooms

## chats テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| sentence          | string     | null: false                    |
| user              | references | null: false, foreign_key: true |
| partner           | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## rooms テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| name              | string     | null: false                    |
| user              | references | null: false, foreign_key: true |

### Association

- has_many :messages
- belongs_to :user

## messages テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| content           | string     | null: false                    |
| user              | references | null: false, foreign_key: true |
| room              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :room
