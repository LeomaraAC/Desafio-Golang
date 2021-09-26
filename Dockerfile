FROM golang:alpine AS builder
COPY . /go/src
WORKDIR /go/src/desafio
RUN go build desafio.go && mkdir builder && mv desafio builder/

FROM scratch
COPY --from=builder /go/src/desafio/builder .
ENTRYPOINT [ "./desafio" ]

