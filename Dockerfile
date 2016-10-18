FROM ruby:2-alpine

RUN apk add --update --no-cache \
      build-base \
      nodejs \
      tzdata \
      libxml2-dev \
      libxslt-dev \
      postgresql-dev

RUN bundle config build.nokogiri --use-system-libraries

ENV APP_HOME /usr/src/app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

EXPOSE 3000

ENV BUNDLE_PATH /ruby_gems

CMD ["bin/rails", "s", "-b", "0.0.0.0"]
