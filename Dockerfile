# https://hub.docker.com/_/alpine
#FROM alpine:latest
FROM ruby:2.7-alpine

RUN apk update
RUN apk --no-cache add curl
RUN apk add jq ruby

RUN gem install octokit

COPY github_pr_comment /usr/local/bin/github_pr_comment
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["sh", "/entrypoint.sh"]
