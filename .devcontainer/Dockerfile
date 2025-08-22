FROM node:20-bullseye


# シェルの利便性
RUN apt-get update -y && apt-get install -y git bash && rm -rf /var/lib/apt/lists/*

# 作業ディレクトリ
WORKDIR /workspace

# VS Code のユーザを node に統一
USER node