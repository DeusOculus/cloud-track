FROM golang:1.22-alpine as build
WORKDIR /app

COPY go.mod .
COPY go.sum .
RUN --mount=type=cache,target=/root/.cache/go-build \
    go mod download -x

COPY . .
RUN --mount=type=cache,target=/root/.cache/go-build \
    go build -v -ldflags="-s -w" -o /bin/app .


FROM alpine:latest
WORKDIR /app

COPY --from=build /bin/app ./bin/app
CMD ["sh", "-c", "./bin/app"]
