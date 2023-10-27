FROM ruby:3.2

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

RUN mkdir /my_app
WORKDIR /my_app

COPY Gemfile /my_app/Gemfile
COPY Gemfile.lock /my_app/Gemfile.lock

RUN bundle install

COPY . /my_app
EXPOSE 80

RUN rails db:create
RUN rails db:migrate
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "80"]



