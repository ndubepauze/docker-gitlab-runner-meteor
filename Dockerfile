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
	&& rm -rf /var/lib/apt/lists/*

RUN curl https://install.meteor.com/ | sh
