ARG BUILD_FROM
FROM $BUILD_FROM

# Install system dependencies
RUN apk add --no-cache python3 py3-pip tini

# Install ALL Python dependencies natively
RUN pip3 install --break-system-packages paho-mqtt requests pyyaml cachetools protobuf

COPY rootfs /
COPY app /app
RUN chmod a+rx /docker-entrypoint.sh

ENTRYPOINT [ "/sbin/tini", "--", "/docker-entrypoint.sh" ]
