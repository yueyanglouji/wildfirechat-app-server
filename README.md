# wildfirechat-app-server

```
mkdir -p /var/chat-app-server
docker run -d --name chat-app-server chenyu1990/wildfirechat-app-server:1.0.0 \
docker cp chat-app-server:/opt/chat-app-server/config /var/chat-app-server
docker rm -f chat-app-server
docker run -d \
    --name chat-app-server \
    --hostname chat-app-server \
    -v /var/chat-app-server/config:/opt/app-server/config \
    -p 8888:8888 \
    --restart on-failure \
    --log-opt max-size=100mb \
    --network chat-network \
    chenyu1990/wildfirechat-app-server:1.0.0
```
