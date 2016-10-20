FROM ruby:2.3-alpine

WORKDIR /rails

# Clean up anything in /rails
RUN rm -fr /rails/*

# Copy in development files
COPY . .

# Add dependencies for Nokogiri install and setup database
RUN apk add --no-cache --virtual .rails-build-deps \
  build-base \
  libxml2-dev \
  libxslt-dev \
  bundle config build.nokogiri --use-system-libraries \
  gem install nokogiri -v '1.6.8' \
  bundle \
  rails db:setup
