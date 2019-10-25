FROM alpine

RUN apk --update add bash openssl

WORKDIR /certs

COPY generate.sh /usr/local/bin/generate.sh

CMD /usr/local/bin/generate.sh

VOLUME /certs
