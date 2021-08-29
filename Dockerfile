FROM golang AS builder
RUN mkdir pastinha
WORKDIR /pastinha
COPY main.go .
RUN go build -ldflags "-w" main.go

FROM scratch
COPY --from=builder /pastinha .
ENTRYPOINT [ "./main" ]