FROM ruby:2.7.1-alpine3.10

# set work directory
WORKDIR /usr/src/blog

# install GCC, G++, Make
RUN apk update \
    && apk add build-base \
    && apk add git \
    && gem update --system \
    && gem install jekyll bundler

# set the volume path in the container
VOLUME ["/usr/src/blog"]

ENTRYPOINT [ "/bin/sh" ]