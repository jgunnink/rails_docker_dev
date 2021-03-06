FROM ruby:2.6.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs postgresql-client
RUN mkdir /myapp
WORKDIR /myapp
COPY ./myapp/Gemfile /myapp/Gemfile
RUN bundle install
