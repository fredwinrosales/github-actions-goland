# Etapa 1: build
FROM golang:1.20 AS builder

WORKDIR /app
COPY . .

RUN go build -o app

# Etapa 2: runtime
FROM gcr.io/distroless/base-debian11

WORKDIR /app
COPY --from=builder /app/app .

EXPOSE 8080

CMD ["./app"]
