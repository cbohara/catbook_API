FROM ruby:2.3.0-alpine

RUN apk add --update \
  build-base \
  libxml2-dev \
  libxslt-dev \
  postgresql-dev \
  && rm -rf /var/cache/apk/*

RUN bundle config build.nokogiri --use-system-libraries

WORKDIR $APP
COPY start.sh template.rb entrypoint.sh install_rails.sh /home/app/

ENTRYPOINT ["/home/app/entrypoint.sh"]
CMD ["/home/app/start.sh"]
