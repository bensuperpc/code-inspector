FROM alpine:3.14

LABEL CREATOR Julien Delange <julien@code-inspector.com>
LABEL MAINTAINER Bensuperpc <bensuperpc@gmail.com>

LABEL org.label-schema.schema-version="1.0" \
   org.label-schema.build-date=$BUILD_DATE \
   org.label-schema.name="bensuperpc/code-inspector" \
   org.label-schema.description="code-inspector in docker" \
   org.label-schema.version=$VERSION \
   org.label-schema.vendor="Bensuperpc" \
   org.label-schema.url="http://bensuperpc.com/" \
   org.label-schema.vcs-url="https://github.com/bensuperpc/code-inspector" \
   org.label-schema.vcs-ref=$VCS_REF \
   org.label-schema.docker.cmd="docker build -t bensuperpc/code-inspector -f Dockerfile ."

RUN apk add py3-pip --no-cache
RUN pip3 install code-inspector --no-cache-dir

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]