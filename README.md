# README
家計簿アプリ:house_with_garden:

## 環境構築方法
### docker-machineで仮想マシンを作成
```
$ docker-machine create --driver virtualbox kakeibo
```

### 環境変数の用意
```
$ cp .env.sample .env
$ vim .env // 必要な環境変数の設定を書き換える
```

## 起動方法(Fish)
### docker-machineの起動
```
$ docker-machine start kakeibo
$ eval (docker-machine env kakeibo)
```

### dockerコンテナの起動
```
$ docker-compose up
```

### url
#### API(Ruby on Rails)
* http://{docker-machineのIP}:3000
#### FRONT(Nuxt.js)
* http://{docker-machineのIP}:8080
