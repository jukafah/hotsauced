FROM ruby:2.5.1 AS base

# needs node for execjs
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && apt update && apt install nodejs -y

FROM base AS dependencies

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1
WORKDIR /usr/src/app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . ./

FROM dependencies AS test
WORKDIR /usr/src/app
RUN rspec
# RUN bundle exec rspec

CMD ["rails"]
