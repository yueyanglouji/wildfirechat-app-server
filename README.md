# wildfirechat-app-server

```
CONFIG_DIR=/var/chat-app-server
mkdir -p /var/chat-app-server
docker run -d --name chat-app-server yueyanglouji/wildfirechat-app-server
docker cp chat-app-server:/apps/app-server/config $CONFIG_DIR
docker rm -f chat-app-server
docker run -d \
    --name chat-app-server \
    --hostname chat-app-server \
    -v /var/chat-app-server/config:/apps/app-server/config \
    -p 8888:8888 \
    --restart on-failure \
    --log-opt max-size=10mb \
    yueyanglouji/wildfirechat-app-server
```
