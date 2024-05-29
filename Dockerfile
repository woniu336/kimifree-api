FROM vinlic/kimi-free-api:latest

ENV TZ=Asia/Shanghai

EXPOSE 8000

CMD ["node", "server.js"]