# node.jsの練習

最初にやること

```
docker compose run --rm web npx --yes create-vite@latest . --template react-ts
```

frontend/node_modulesができる。

```
◇  Current directory is not empty. Please choose how to proceed:
```
と言われるけど Ignore files and continue する(docker-compose.ymlでfrontendディレクトリ以下にnode_modulesディレクトリが作られてしまうのが原因)
