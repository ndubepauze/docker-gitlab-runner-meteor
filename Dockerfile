FROM node:4.8.4

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

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen en_US.UTF-8 && \
    dpkg-reconfigure locales && \
    /usr/sbin/update-locale LANG=en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN curl https://install.meteor.com/ | sh

ENV METEOR_ALLOW_SUPERUSER true
