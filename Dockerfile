FROM golang:1.16-alpine3.13 AS builder
RUN go install -tags 'postgres' github.com/golang-migrate/migrate/v4/cmd/migrate@latest
WORKDIR /go/bin
FROM alpine:3.7
COPY --from=builder /go/bin/migrate /usr/local/bin/migrate