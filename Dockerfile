# Decidim Application Dockerfile
# This is an image to start an application based on Decidim (https://decidim.org)
# You can see the Installation process on https://docs.decidim.org/install/docker
#

# Starts with a clean ruby image from Debian
# As per ruby's Docker image recommendations we don't use alpine nor slim
# If you have space disk contrains you could use those although it's going to need adjustments
#
# Also we don't use -onbuild as they're deprecated
# https://github.com/docker-library/official-images/issues/2076
ARG RUBY_VERSION
FROM ruby:${RUBY_VERSION}
LABEL maintainer="hola@decidim.org"

ARG BUNDLER_VERSION

# Installs system dependencies
# One package each line and sorted alphabetically
# We clean up after as there's some apt caching that we don't need here
RUN apt-get update -qq \
    && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
      build-essential \
      graphviz \
      imagemagick \
      libicu-dev \
      libpq-dev \
      nodejs \
    && apt-get clean \
    && rm -rf /var/cache/apt/archives/* \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && truncate -s 0 /var/log/*log

# Sets workdir as /usr/src/app
# We try to follow the Filesystem Hierarchy Standard (FHS)
ENV APP_HOME /usr/src/app/
RUN mkdir ${APP_HOME}
WORKDIR ${APP_HOME}

# Update system gems
RUN gem update --system

# Create an user for the application for security
RUN useradd -m -s /bin/bash -u 1000 decidim

# Copy Gemfile and install bundler dependencies
COPY --chown=decidim:decidim Gemfile Gemfile.lock ${APP_HOME}
# We want to run binstubs without prefixing `bin/` or `bundle exec`
ENV LANG=C.UTF-8 \
  BUNDLE_JOBS=20 \
  BUNDLE_RETRY=5
RUN gem install bundler:${BUNDLER_VERSION}
RUN bundle install --quiet

# We don't expose the port 3000 and we don't start the webserver as this same image
# that we're going to use for the 'worker' service. See the docker-compose.yml file to
# see how the commands are started.
# EXPOSE 3000

# Changes the active user on the container
USER decidim

# Copy all the code to /usr/src/app
COPY --chown=decidim:decidim . ${APP_HOME}
