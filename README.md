# wildfirechat-app-server

```
CONFIG_DIR=/data/chat-config/app
mkdir -p /data/chat-config/app
docker run -d --name chat-app-server chenyu1990/wildfirechat-app-server:1.0.0
docker cp chat-app-server:/opt/app-server/config $CONFIG_DIR
docker rm -f chat-app-server
docker run -d \
    --name chat-app-server \
    --hostname chat-app-server \
    -v $CONFIG_DIR:/opt/app-server/config \
    -p 8888:8888 \
    --restart on-failure \
    --log-opt max-size=100mb \
    --network chat-network \
    chenyu1990/wildfirechat-app-server:1.0.0
```
