FROM ruby:3.1.2

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /rinha_api
COPY Gemfile /rinha_api/Gemfile
COPY Gemfile.lock /rinha_api/Gemfile.lock
RUN bundle install
COPY . .
