FROM golang:1.22 as build
WORKDIR /app

COPY go.mod .
COPY go.sum .
RUN go mod download

COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /bin/app .


FROM alpine:latest
WORKDIR /app

COPY --from=build /bin/app ./bin/app

ENTRYPOINT ["./bin/app"]
