FROM golang:latest as builder
WORKDIR /program111/
RUN go get -d -v golang.org/x/net/html
ADD skrypt.go ./hello_world.go
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .
FROM scratch
COPY --from=builder /program111/app .
CMD ["./app"]
