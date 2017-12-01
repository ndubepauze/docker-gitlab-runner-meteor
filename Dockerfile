FROM node:8.9.1

MAINTAINER Mitchell Bundy <mitch@bundy.ca>

RUN apt-get update \
  && apt-get upgrade -y \
	&& apt-get install -y --no-install-recommends \
		ca-certificates \
    curl \
    graphicsmagick \
		numactl \
    locales \
    bzip2 \
    build-essential \
    python \
    git \
    locales \
	&& rm -rf /var/lib/apt/lists/*

RUN dpkg-reconfigure locales && \
    locale-gen C.UTF-8 && \
    /usr/sbin/update-locale LANG=C.UTF-8

ENV LC_ALL C.UTF-8

RUN curl https://install.meteor.com/ | sh

ENV METEOR_ALLOW_SUPERUSER true
