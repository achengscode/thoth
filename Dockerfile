FROM elixir:1.9-slim

ENV WORK_DIR /var/www/app
ENV NODE_VER 10.x

# Add a new user that isn't root
RUN groupadd -r thoth && useradd -r -s /bin/bash -g thoth thoth

# Install pandoc and inotify-tools
RUN apt-get update && apt-get install -y pandoc inotify-tools curl nodejs

# Install nodeJS at LTS version.
RUN curl -sL https://deb.nodesource.com/setup_$NODE_VER | bash - 
RUN apt-get install -y nodejs 

# Install phoenix
RUN mix local.hex --force && mix archive.install hex phx_new 1.4.10 --force

WORKDIR $WORK_DIR

COPY . $WORK_DIR
