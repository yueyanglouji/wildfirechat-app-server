# wildfirechat-app-server

```
docker run -d \
    --name chat-app-server \
    --hostname chat-app-server \
    -v /data/chat-app-server/config:/opt/app-server/config \
    -p 8888:8888 \
    --restart on-failure \
    --log-opt max-size=100mb \
    chenyu1990/chat-app-server:1.0.0
```
