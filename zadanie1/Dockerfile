FROM alpine:latest



RUN apk update
RUN apk add curl
RUN apk add sudo

RUN addgroup -S appgroup && adduser -S appuser -G appgroup
WORKDIR /home/appuser
COPY . .

RUN  sudo curl -L https://repo1.maven.org/maven2/com/lihaoyi/mill-dist/1.0.6/mill-dist-1.0.6-mill.sh -o mill
RUN chmod +x mill

EXPOSE 8080

CMD ["sudo","./mill","-w","app.runBackground"]