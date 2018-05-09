FROM alpine:edge
MAINTAINER Tsuki <i@sukitsuki.com>

ENV LANG C.UTF-8

RUN apk add --update --no-cache ca-certificates

RUN set -ex && apk add --no-cache --virtual .run-deps \
                ffmpeg \
                libmagic \
                python3 \
                curl \
                tar \
                zlib-dev \
                py3-numpy \
                py3-pillow
WORKDIR /tmp
ADD requirement.txt .
RUN set -ex && apk add --no-cache --virtual .run-deps \
                       jpeg-dev \
                       freetype-dev \
                       lcms2-dev \
                       openjpeg-dev \
                       tiff-dev \
                       tk-dev \
                       build-base \
                       python3-dev \
                       tcl-dev
RUN pip3 install -r requirement.txt
COPY profiles /root/.ehforwarderbot/profiles
RUN ls -lr /root/.ehforwarderbot
CMD [ "executable" ]