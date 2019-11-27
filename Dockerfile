FROM ubuntu:18.04
  
LABEL maintainer="ChenYu <195936617@qq.com>"

ENV JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
ENV JRE_HOME=$JAVA_HOME/jre
ENV CLASS_PATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
ENV PATH=${JAVA_HOME}/bin:$PATH

ENV M2_HOME=/root/apache-maven-3.6.1
ENV M2=$M2_HOME/bin
ENV PATH=$M2:$PATH

RUN apt update && \
    apt install git wget openjdk-8-jdk -y && \
    cd /root && \
    wget http://www-eu.apache.org/dist/maven/maven-3/3.6.1/binaries/apache-maven-3.6.1-bin.tar.gz && \
    tar zxvf apache-maven-3.6.1-bin.tar.gz && \
    git clone https://github.com/wildfirechat/im-app_server && \
    cd /root/im-app_server && \
    mvn package && \
    mkdir -p /opt/app-server && \
    cd /opt/app-server && \
    cp /root/im-app_server/target/app-*.jar . && \
    export APP=`ls *.jar` && \
    rm -rf /root/* && \
    echo "java -jar $APP" > /opt/app-server/startup.sh

WORKDIR /opt/app-server

EXPOSE 8888

CMD ["sh", "startup.sh"]
