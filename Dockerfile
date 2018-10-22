FROM ruby:2.5.3

# Add aliyun source
echo "http://mirrors.aliyun.com/alpine/v3.8/main/" > /etc/apk/repositories
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Install Rails App
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
COPY . /myapp