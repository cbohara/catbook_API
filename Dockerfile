FROM ruby:2.3.0-alpine

RUN apk add --update \
  build-base \
  libxml2-dev \
  libxslt-dev \
  postgresql-dev \
  && rm -rf /var/cache/apk/*

RUN bundle config build.nokogiri --use-system-libraries
