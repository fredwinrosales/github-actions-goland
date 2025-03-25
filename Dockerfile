FROM golang:1.24 AS builder

WORKDIR /app
COPY . .

# Desactiva cgo y fuerza build estático
ENV CGO_ENABLED=0
RUN go build -o app

FROM gcr.io/distroless/static
WORKDIR /app
COPY --from=builder /app/app .

EXPOSE 8080
CMD ["./app"]