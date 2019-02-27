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
