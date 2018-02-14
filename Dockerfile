FROM ruby:2.5.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /craft_your_web
WORKDIR /craft_your_web
COPY Gemfile /craft_your_web/Gemfile
COPY Gemfile.lock /craft_your_web/Gemfile.lock
RUN bundle install
COPY . /craft_your_web

EXPOSE 3000

# The default command that gets ran will be to start the Puma server.
CMD bundle exec puma -C config/puma.rb