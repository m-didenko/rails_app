FROM ruby:3.2

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

RUN mkdir /rails_app
WORKDIR /rails_app

COPY Gemfile /rails_app/Gemfile
COPY Gemfile.lock /rails_app/Gemfile.lock

RUN bundle install

COPY . /rails_app
EXPOSE 80
CMD ["rails", "server", "-b", "0.0.0.0"]