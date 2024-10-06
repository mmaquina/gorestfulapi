# Stage 1: Build the Go app
FROM golang:1.23.1-alpine AS builder

WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . .
# Build the Go app for Linux OS
RUN go build -o gorestfulapi

# Stage 2: Run the Go app
FROM alpine:latest
WORKDIR /app

# Copy the binary from the builder stage
COPY --from=builder /app/gorestfulapi .

# Set the binary as the entrypoint for the container
ENTRYPOINT ["./gorestfulapi"]
