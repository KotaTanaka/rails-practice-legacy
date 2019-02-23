# Find Wi-Fi API
Wi-Fiスポット検索サービスのバックエンドのリポジトリです。

## ローカル開発環境構築
#### ソースコードのクローン

```
$ git clone git@github.com:KotaTanaka/wifi-map-api.git
```

#### rbenv のインストール

```
$ brew update
$ brew install rbenv
$ echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
$ source ~/.bash_profile
$ rbenv install 2.5.3
$ rbenv global 2.5.3
```

#### Rails のインストール

```
$ gem install bundler --no-document
$ gem install rails --no-document
```

#### アプリケーションの起動

```
$ rails db:migrate
$ rails s
```

→ http://localhost:3000 でアプリケーションにアクセスできます。
