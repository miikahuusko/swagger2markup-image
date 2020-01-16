FROM openjdk:8-jre-alpine
MAINTAINER Miika Huusko

WORKDIR /usr/bin/swagger2markup

RUN apk update \
    && apk add ca-certificates wget \
    && update-ca-certificates \
    && wget https://jcenter.bintray.com/io/github/swagger2markup/swagger2markup-cli/1.3.3/swagger2markup-cli-1.3.3.jar

ENV JAVA_OPTS="-Dfile.encoding=UTF-8 -Dsun.jnu.encoding=UTF-8"

RUN mkdir /app
WORKDIR /app

ENTRYPOINT ["java","-jar","/usr/bin/swagger2markup/swagger2markup-cli-1.3.3.jar"]
