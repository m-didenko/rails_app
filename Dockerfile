#FROM ruby:3.2
#
#RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
#
#RUN mkdir /rails_app
#WORKDIR /rails_app
#
#COPY Gemfile /rails_app/Gemfile
#COPY Gemfile.lock /rails_app/Gemfile.lock
#
#RUN bundle install
#
#COPY . /rails_app
#EXPOSE 3000
#CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3000"]

FROM ubuntu:20.04

RUN apt-get update && apt-get install -y python3 python3-pip

RUN pip install flask

COPY app.py /opt/

EXPOSE 80
ENTRYPOINT FLASK_APP=/opt/app.py flask run --host=0.0.0.0 --port=80

