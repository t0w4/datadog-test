FROM ruby:2.6.3-alpine as builder
RUN apk --update add --virtual build-dependencies \
    build-base \
    curl-dev \
    mysql-dev \
    linux-headers
RUN gem install bundler
WORKDIR /tmp
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
ENV BUNDLE_JOBS=4
RUN bundle install
RUN apk del build-dependencies

FROM ruby:2.6.3-alpine
ENV LANG ja_JP.UTF-8
RUN apk --update add \
    bash \
    mariadb-dev \
    tzdata
RUN gem install bundler

WORKDIR /tmp
COPY --from=builder /usr/local/bundle /usr/local/bundle

ENV APP_HOME /myapp
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
COPY . $APP_HOME

# Start the main process.
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]