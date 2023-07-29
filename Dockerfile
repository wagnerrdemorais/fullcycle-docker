FROM golang:1.21rc3-alpine as builder

WORKDIR /usr/src/app

COPY /fullcycle ./
RUN go mod download && go mod verify && go build

FROM scratch
WORKDIR /usr/src/app
COPY --from=builder /usr/src/app/fullcycle .

CMD ["./fullcycle"]