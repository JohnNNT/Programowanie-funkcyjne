FROM nightscape/scala-mill:latest

COPY . .

EXPOSE 8080

CMD ["sh","mill", "-w", "app.runBackground"]