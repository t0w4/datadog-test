# README

DatadogのAPMとlogの実装確認用リポジトリ

### 試しかた
１. docker-compose.yml の <DatadogのAPI KEY>　の部分を実際の値に書き換える。

２. コンテナを起動する。
```bash
docker-compose up -d --build
```
３. DBを作成する。
```bash
docker-compose run api bundle exec rails db:create
```

４. テーブルの作成を適用する。
```bash
docker-compose run api bundle exec rails db:migrate RAILS_ENV=development
```

５. コンテナを再起動する。
```bash
docker-compose up -d --build
```

６. Datadogの画面でAPM、logが取得できていることを確認する。