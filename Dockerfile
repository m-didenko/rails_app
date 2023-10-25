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
#EXPOSE 80
#CMD ["rails", "server", "-b", "0.0.0.0"]

FROM ubuntu
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install apache2 -y
RUN apt-get install apache2-utils -y
RUN apt-get clean
EXPOSE 80
RUN echo "Hello From Server" > /var/www/html/index.html
CMD ["apache2ctl","-D","FOREGROUND"]