# ENV CI=${CI}
# ARG CODECOV_TOKEN

FROM ruby:2.5.1 AS base
# ENV CI=${CI}
# ENV CODECOV_TOKEN=${CODECOV_TOKEN}
ARG CI
RUN echo $CI

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
RUN export CI=$CI && bundle exec rspec ; exit 0

CMD ["rails"]
