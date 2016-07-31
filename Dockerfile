FROM ruby:2.3.1-slim

RUN apt-get update -qq && \
    apt-get install -y \
      build-essential git \
      postgresql-client libpq-dev --no-install-recommends && \
    apt-get clean

RUN gem install bundler

ENV APP /app
RUN mkdir $APP
WORKDIR $APP

ENV BUNDLE_PATH /box

EXPOSE 3000

ENTRYPOINT bin/docker-entrypoint.sh $0 $@
