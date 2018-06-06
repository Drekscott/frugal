FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /frugal
WORKDIR /frugal
COPY Gemfile /frugal/Gemfile
COPY Gemfile.lock /frugal/Gemfile.lock
RUN bundle install
COPY . /frugal
EXPOSE 3000
CMD ["rails", "s"]

