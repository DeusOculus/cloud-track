FROM alpine:latest
WORKDIR /app

COPY ../bin/app ./bin/app
ENTRYPOINT ["./bin/app"]
