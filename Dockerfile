FROM python:2-alpine
LABEL maintainer="ops-dev@lists.openswitch.net"

RUN apk add --no-cache bash git
RUN pip install trac TracAccountManager

RUN addgroup -S trac && adduser -S -G trac trac

RUN mkdir /trac && chown -R trac:trac /trac
USER trac
WORKDIR /trac

EXPOSE 8000

COPY assets/* /

CMD /init.sh
