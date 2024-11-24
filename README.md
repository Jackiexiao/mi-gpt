# 小爱音箱接入 Chatgpt

原仓库: https://github.com/idootop/mi-gpt

这个 README 简化了部署的说明，实际体验下来，接入效果差强人意吧...

1. 延迟较高
2. 原来的小爱同学会在 AI 回答之前抢话，而且问题无解

## 安装方法

```
git clone https://github.com/Jackiexiao/mi-gpt
cd mi-gpt/
cp .env.example .env # 然后修改 apikey 等
cp .migpt.example.js .migpt.js # 然后修改
bun install

# 快速启动
bun run start
```

也可以选择 pm2 启动，更稳定点

```
## 全局安装 PM2
bunx pm2@latest install -g

## 使用 PM2 启动 Bun 的 start 脚本
pm2 start bun --name "mi-gpt" -- start
```

## 使用方法

对着小爱音箱说：

小爱同学，请问 XXX
小爱同学，进入 AI 模式

## 可选

修改 .migpt.js # 这里我设置了一些默认配置

## FAQ

Q：原来的小爱同学会在 AI 回答之前抢话？
与本项目的实现原理有关。本项目通过轮询小米接口获取最新的对话信息，当检测到小爱在回复的时候会通过播放静音音频等方式快速 mute 掉小爱原来的回复。但是从小爱开始回复，到上报状态给小米服务云端，再到本项目通过小米云端接口轮训到这个状态变更，中间会有大约 1 -2 秒的延迟时间，无解。

这个问题，理论上需要通过刷机才能完美解决，可以参考下面的相关讨论：

yihong0618/xiaogpt#515 (comment)
#21 (comment)

Q：异地登录的问题（比如服务器在上海，你人在广州）
https://github.com/idootop/mi-gpt/blob/main/docs/faq.md#q%E6%8F%90%E7%A4%BA%E8%A7%A6%E5%8F%91%E5%B0%8F%E7%B1%B3%E8%B4%A6%E5%8F%B7%E5%BC%82%E5%9C%B0%E7%99%BB%E5%BD%95%E4%BF%9D%E6%8A%A4%E6%9C%BA%E5%88%B6

## 其他问题

请参考原仓库: https://github.com/idootop/mi-gpt
