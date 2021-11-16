FROM ruby:3.0.0
RUN apt-key adv --fetch-keys https://dl.yarnpkg.com/debian/pubkey.gpg
RUN apt-get update -qq && apt-get install -y build-essential nodejs npm libpq-dev postgresql-client
RUN npm install -g yarn
RUN mkdir /usr/src/openvagas
WORKDIR /usr/src/openvagas
ADD . /usr/src/openvagas
RUN gem install bundler -v 2.2.3
RUN bundle install