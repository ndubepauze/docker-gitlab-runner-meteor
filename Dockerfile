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

RUN dpkg-reconfigure locales \
  && locale-gen en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN curl https://install.meteor.com/ | sh

ENV METEOR_ALLOW_SUPERUSER true
