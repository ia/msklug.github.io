# Create a Jekyll container

# At a minimum, use Ruby 3.0 or later
FROM ruby:3.2.2-slim-bullseye

WORKDIR /srv/jekyll

# Add Jekyll dependencies
RUN apt  update  -y
RUN apt  install -y  --no-install-suggests  --no-install-recommends  build-essential  gcc  cmake  git

COPY ./Gemfile* /srv/jekyll

# Update the Ruby bundler and install Jekyll
# # have no idea how it works but jekyll/bundle/ruby always complain about something so it's impossible to use easy & simple commands here;
# # if it still doesn't work - run:
# $ docker-compose  -f docker-compose.yml  run  -p 8080:8080  -p 50000:50000  --rm  jekyll
# two or maybe even three times - usually it helps for local instance.
RUN gem update bundler
RUN bundle update github-pages || bundle install
RUN bundle install
RUN bundle update github-pages
RUN bundle install

EXPOSE 8080

