#!/bin/bash

# 读取配置参数（Home Assistant 会将这些注入环境变量）
DOMAIN=$(jq -r '.domain' /data/options.json)
PORT=$(jq -r '.port' /data/options.json)
SECRET=$(jq -r '.secret' /data/options.json)
ARGS=$(jq -r '.args // empty' /data/options.json)
PLATFORM=$(jq -r '.platform // empty' /data/options.json)
VERSION=$(jq -r '.version // empty' /data/options.json)

# 打印调试信息
echo "✅ 启动 Nezha Agent"
echo "➡️  domain=$DOMAIN"
echo "➡️  port=$PORT"
echo "➡️  secret=$SECRET"
echo "➡️  args=$ARGS"
echo "➡️  platform=$PLATFORM"
echo "➡️  version=$VERSION"

/nezha-agent \
  -s "$DOMAIN:$PORT" \
  -p "$SECRET" \
  ${ARGS:+$ARGS} \
  ${PLATFORM:+--platform "$PLATFORM"} \
  ${VERSION:+--version "$VERSION"}
