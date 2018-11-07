FROM ruby:2.5

RUN mkdir /app

# RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt-get install -y nodejs

WORKDIR /app

ADD Gemfile /app/Gemfile

ADD Gemfile.lock /app/Gemfile.lock

RUN bundle install

COPY . /app
