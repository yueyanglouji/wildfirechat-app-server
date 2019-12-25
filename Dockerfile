FROM centos:7
  
LABEL maintainer="yueyanglouji <343468684@qq.com>"

ENV JAVA_HOME="/usr/lib/jvm/java"
ENV JRE_HOME=$JAVA_HOME/jre
ENV CLASS_PATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
ENV PATH=${JAVA_HOME}/bin:$PATH

ENV M2_HOME=/root/apache-maven-3.6.3
ENV M2=$M2_HOME/bin
ENV PATH=$M2:$PATH

RUN yum install git wget java-1.8.0-openjdk java-1.8.0-openjdk-devel -y
RUN cd /root
RUN mkdir -p /apps/app-server
RUN cd /root && wget http://mirrors.ocf.berkeley.edu/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
RUN cd /root && tar zxvf apache-maven-3.6.3-bin.tar.gz
ADD ./im-app_server /root/im-app_server
RUN ls /root
RUN cp -r /root/im-app_server/config /apps/app-server/
RUN cd /root/im-app_server
RUN cd /root/im-app_server && mvn package
RUN cd /apps/app-server && \
    cp /root/im-app_server/target/app-*.jar . && \
    export APP=`ls *.jar` && \
    rm -rf /root/* && \
    echo "java -jar $APP" > /apps/app-server/startup.sh

WORKDIR /apps/app-server

EXPOSE 8888

CMD ["sh", "startup.sh"]
