ARG BUILD_FROM=hassioaddons/base-amd64:1.3.1
FROM ${BUILD_FROM}

LABEL maintainer "Andrew <me@duck.me.uk>"

RUN apk add --no-cache python3 \
    libusb \
    py3-cffi \
    openssl \
    libc-dev \
    ca-certificates \
    python3-dev \
    py3-pytest \
    gcc \
    py3-cryptography \
    py3-paramiko \
    gnuplot \
    && update-ca-certificates

RUN pip3 install --upgrade pip
RUN pip3 install \
    libusb1 \
    python-twitter \
    oauth2 \
    tzlocal \
    pycrypto \
    paho-mqtt \
    pywws

VOLUME ["/var/data"]

# Build arugments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

# Labels

LABEL \
    io.hass.name="pywws" \
    io.hass.description="pywws" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Matthew Hilton <matthilton2005@gmail.com>" \
    org.label-schema.description="pywws" \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.name="pywws" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.url="" \
    org.label-schema.usage="" \
    org.label-schema.vcs-ref=${BUILD_REF} \
    org.label-schema.vcs-url="" \
    org.label-schema.vendor=""