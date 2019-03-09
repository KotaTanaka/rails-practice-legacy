# Find Wi-Fi API
Wi-Fiスポット検索サービスのバックエンドのリポジトリです。

## ローカル開発環境構築
#### ソースコードのクローン

```
$ git clone git@github.com:KotaTanaka/wifi-map-api.git
```

#### rbenv・Railsのインストール

```
$ brew update
$ brew install rbenv
$ echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
$ source ~/.bash_profile
$ rbenv install 2.5.3
$ rbenv global 2.5.3
$ gem install bundler --no-document
$ gem install rails --no-document
```

#### MySQLのインストール・データベースの作成

```
$ gem install mysql2 -v '0.5.2' --source 'https://rubygems.org/'
$ bundle install
$ mysql -u root -p
mysql> grant all privileges on wifi_map_db.* to rails@localhost identified by 'password' with grant option;
mysql> \q
$ rails db:create
```

#### アプリケーションの起動

```
$ rails db:migrate
$ rails s
```

→ http://localhost:3000 でアプリケーションにアクセスできます。

## テーブル定義

#### Wi-Fiサービステーブル

```
+------------+--------------+------+-----+
| Field      | Type         | Null | Key |
+------------+--------------+------+-----+
| id         | varchar(32)  | NO   | PRI |
| wifi_name  | varchar(255) | NO   |     |
| link       | varchar(255) | YES  |     |
| created_at | datetime     | NO   |     |
| updated_at | datetime     | NO   |     |
+------------+--------------+------+-----+
```

#### Wi-Fi利用可能店舗テーブル

```
+----------------+--------------+------+-----+
| Field          | Type         | Null | Key |
+----------------+--------------+------+-----+
| id             | varchar(36)  | NO   | PRI |
| ssid           | varchar(255) | NO   |     |
| shop_name      | varchar(255) | NO   |     |
| address        | varchar(255) | NO   |     |
| shop_type      | varchar(255) | YES  |     |
| opening_houres | varchar(255) | YES  |     |
| seats_num      | int(11)      | YES  |     |
| power          | tinyint(1)   | YES  |     |
| descriotion    | text         | YES  |     |
| created_at     | datetime     | NO   |     |
| updated_at     | datetime     | NO   |     |
| service_id     | varchar(32)  | NO   | MUL |
+----------------+--------------+------+-----+
```

#### レビューテーブル

```
+----------------+-------------+------+-----+
| Field          | Type        | Null | Key |
+----------------+-------------+------+-----+
| id             | varchar(32) | NO   | PRI |
| comment        | text        | NO   |     |
| publish_status | tinyint(1)  | NO   |     |
| evaluation     | tinyint(4)  | NO   |     |
| created_at     | datetime    | NO   |     |
| updated_at     | datetime    | NO   |     |
| shop_id        | varchar(36) | NO   | MUL |
+----------------+-------------+------+-----+
```
