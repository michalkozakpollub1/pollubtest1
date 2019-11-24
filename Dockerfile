FROM golang:latest as builder
WORKDIR /go-http-hello-world/
RUN go get -d -v golang.org/x/net/html
ADD skrypt.go ./hello_world.go
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .
FROM scratch
COPY --from=builder /go-http-hello-world/app .
CMD ["./app"]