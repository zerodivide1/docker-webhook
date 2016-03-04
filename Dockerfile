FROM        alpine
MAINTAINER  Almir Dzinovic <almirdzin@gmail.com>

ENV         GOPATH /go
ENV         SRCPATH ${GOPATH}/src/github.com/adnanh
RUN         apk add --update -t build-deps curl go git libc-dev gcc libgcc && \
            curl -L -o /tmp/webhook-latest.tar.gz https://github.com/adnanh/webhook/archive/2.3.7.tar.gz && \
            mkdir -p ${SRCPATH} && tar -xvzf /tmp/webhook-latest.tar.gz -C ${SRCPATH} && \
            mv -f ${SRCPATH}/webhook-* ${SRCPATH}/webhook && \
            cd ${SRCPATH}/webhook && go get -d && go build -o /usr/local/bin/webhook && \
            apk del --purge build-deps && \
            rm -rf /var/cache/apk/* && \
            rm -rf ${GOPATH}

EXPOSE      9000
ENTRYPOINT  ["/usr/local/bin/webhook"]
