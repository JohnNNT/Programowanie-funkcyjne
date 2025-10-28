FROM sbtscala/scala-sbt:eclipse-temurin-alpine-24.0.1_9_1.11.7_3.7.3

WORKDIR /root/c/Users/tarcz/Documents/programowanie-funkcyjne/Programowanie-funkcyjne/zadanie1

COPY . .

EXPOSE 8080

CMD ["./mill","-w","app.runBackground"]