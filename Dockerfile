FROM ruby:2.3-alpine

WORKDIR /rails

# Clean up anything in /rails
RUN rm -fr /rails/*

# Move the development Gemfile into place
COPY rails-server/Gemfile /rails/
COPY rails-server/Gemfile.lock /rails/

# Add build stuff for nokogiri (and others??)
RUN apk add --no-cache --virtual .rails-build-deps \
        build-base \
        libxml2-dev \
        libxslt-dev

RUN bundle config build.nokogiri --use-system-libraries
RUN gem install nokogiri -v '1.6.8'
RUN bundle

# We don't want any external mounting other than logs
VOLUME ["/rails/log"]

# Setup the entrypoint
COPY docker-entrypoint.sh /bin/
RUN chmod +x /bin/docker-entrypoint.sh

# Get stuff running
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["rails", "server", "puma"]
