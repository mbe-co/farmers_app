FROM ruby:3.0.1

# install dependencies (nodejs and yarn) and postgres client
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt update -qq && apt install -y nodejs yarn postgresql-client

WORKDIR /farmers_app

COPY Gemfile /farmers_app/Gemfile
COPY Gemfile.lock /farmers_app/Gemfile.lock

RUN bundle install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

CMD ["rails", "server", "-b", "0.0.0.0"]
