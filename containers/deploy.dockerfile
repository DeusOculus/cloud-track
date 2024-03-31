FROM alpine:latest
WORKDIR /app

COPY --chmod=777 ../bin/app ./bin/app
RUN ls -lA ./bin/
ENTRYPOINT ["./bin/app"]
