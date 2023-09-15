# Dockerfile

FROM ruby:3.0.3

ADD . /tanuki-racing-appliation
WORKDIR /tanuki-racing-appliation

RUN gem install bundler

RUN bundle install

EXPOSE 8080
CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "-p", "8080"]
