FROM golang:1.18-alpine AS builder

WORKDIR /usr/src/app

COPY . .
RUN go mod tidy

RUN go build -v -o /usr/local/bin/app ./...

FROM scratch

WORKDIR /usr/src/app

COPY --from=builder /usr/local/bin/app .

ENTRYPOINT [ "./app" ]
