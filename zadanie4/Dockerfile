FROM alpine:latest

COPY . /usr/src

WORKDIR /usr/src

RUN apk update && apk upgrade && apk add curl && wget -O /etc/apk/keys/adoptium.rsa.pub https://packages.adoptium.net/artifactory/api/security/keypair/public/repositories/apk && echo 'https://packages.adoptium.net/artifactory/apk/alpine/main' >> /etc/apk/repositories && apk add temurin-25-jdk && curl -L https://repo1.maven.org/maven2/com/lihaoyi/mill-dist/1.1.1/mill-dist-1.1.1-mill.sh -o mill && chmod +x mill && ./mill app.compile

EXPOSE 8080

CMD ["sh","./mill", "-w", "app.runBackground"]