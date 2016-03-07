FROM gliderlabs/alpine:3.1

MAINTAINER CenturyLink Labs <clt-labs-futuretech@centurylink.com>

RUN apk-install openssl
CMD /usr/bin/openssl genrsa -out /certs/${KEY_NAME}.key 2048 && \
    /usr/bin/openssl req -sha256 -new -newkey rsa:2048 -days 365 -nodes -subj "/C=${COUNTRY_NAME}/ST=/L=${LOCATION_NAME}/O=${ORGANIZATION_NAME}/CN=${COMMON_NAME}" -keyout /certs/${KEY_NAME}.key -out /certs/${KEY_NAME}.csr  && \
    /usr/bin/openssl x509 -req -days 365 -in /certs/${KEY_NAME}.csr -signkey /certs/${KEY_NAME}.key -out /certs/${KEY_NAME}.crt
