#BusCombinedPmisImage
FROM ruby:3.1.3-alpine AS builder
ENV LANG C.UTF-8

RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN apk add --no-cache build-base mariadb-dev tzdata

ADD ./Gemfile Gemfile
ADD ./Gemfile.lock Gemfile.lock
RUN bundle install
  FROM ruby:3.1.3-alpine AS runner
RUN apk add --no-cache build-base mariadb-dev tzdata

WORKDIR /app

# Setting environment variables
#ENV MYSQL_HOST hostip
#ENV MYSQL_USER username
#ENV MYSQL_PASSWORD password
#ENV MYSQL_DB database

# We copy over the entire gems directory for our builder image, containing the already built artifact
COPY --from=builder /usr/local/bundle/ /usr/local/bundle/
COPY . .
EXPOSE 3000

CMD rm -f tmp/pids/server.pid
# Configure the main process to run when running the image
CMD ["rails", "s", "-b", "0.0.0.0"]
