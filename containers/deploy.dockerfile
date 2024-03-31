FROM alpine:latest
WORKDIR /app

COPY --chmod=755 ../bin/app ./bin/app
RUN ls -lA ./bin/
ENTRYPOINT ["./bin/app"]
