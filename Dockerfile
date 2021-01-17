FROM golang:alpine3.11 as firststage
WORKDIR /pacoloco
ADD . .
RUN go build
FROM alpine:3.11
WORKDIR /pacoloco
VOLUME /etc/pacoloco.yaml
EXPOSE 9129
COPY --from=firststage /pacoloco/pacoloco .
CMD ["./pacoloco"]
