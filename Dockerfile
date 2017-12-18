FROM python:2-alpine
MAINTAINER Steve Katen <steve.katen@rackspace.com> 

ENV PYCURL_SSL_LIBRARY=openssl
RUN apk add --no-cache --update openssl curl \
    && apk add --no-cache --update --virtual .build-deps build-base python-dev curl-dev jq \
    && pip install jmespath pyresttest \
    && apk del .build-deps

WORKDIR /tests

ENTRYPOINT ["pyresttest"]
