FROM ruby:2.3.0-alpine

RUN apk update && apk add --no-cache \
  autoconf \
  automake \
  bzip2 \
  bzip2-dev \
  ca-certificates \
  curl \
  curl-dev \
  file \
  g++ \
  gcc \
  geoip-dev \
  git \
  glib-dev \
  imagemagick \
  jpeg-dev \
  libc-dev \
  libevent-dev \
  libffi-dev \
  libpng-dev \
  libpq \
  libtool \
  libwebp-dev \
  libxml2-dev \
  libxslt-dev \
  linux-headers \
  make \
  nodejs \
  ncurses-dev \
  openssl-dev \
  patch \
  postgresql-dev \
  readline-dev \
  sqlite-dev \
  xz-dev \
  yaml-dev \
  zlib-dev

RUN bundle config build.nokogiri --use-system-libraries

ENV INSTALL_PATH /src/catbook
RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH

COPY Gemfile Gemfile
RUN bundle install

COPY . .

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
