# Dockerfile

FROM ruby:3.0.3

WORKDIR /tanuki-racing-appliation
COPY . /tanuki-racing-appliation
RUN bundle install

CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "-p", "80"]
