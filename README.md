# README
家計簿アプリ

## 起動方法
### docker-machineの起動
```
$ docker-machine start kakeibo
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
