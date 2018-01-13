FROM ruby:2.3-slim
# Installing dependencies
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
      build-essential nodejs libpq-dev
# Path config
ENV INSTALL_PATH /usr/src/app
# Creating directory
RUN mkdir -p $INSTALL_PATH
# Sets our path as the main directory
WORKDIR $INSTALL_PATH
# Placing Gemfile inside container
COPY Gemfile ./
# Installing gems
RUN bundle install
# Placing our code inside container
COPY . .
# Running the server
CMD ["rails", "server", "-b", "0.0.0.0"]
