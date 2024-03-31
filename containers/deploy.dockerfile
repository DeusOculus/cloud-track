FROM alpine:latest
WORKDIR /app

COPY --chmod=577 ../bin/app ./bin/app
ENTRYPOINT ["./bin/app"]
