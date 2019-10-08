FROM elixir:1.9-slim

ENV WORK_DIR /var/www/app
ENV NODE_VER 10.x
ENV PANDOC_VER 2.7.3

# Add a new user that isn't root
RUN groupadd -r thoth && useradd -r -s /bin/bash -g thoth thoth

# Install pandoc and inotify-tools
RUN apt-get update && apt-get install -y inotify-tools curl nodejs

# Install nodeJS at LTS version.
RUN curl -sL https://deb.nodesource.com/setup_$NODE_VER | bash - 
RUN apt-get install -y nodejs 

# Install Pandoc
RUN curl -LJO https://github.com/jgm/pandoc/releases/download/2.7.3/pandoc-$PANDOC_VER-1-amd64.deb
RUN dpkg -i pandoc-$PANDOC_VER-1-amd64.deb
RUN apt-get install -f

# Install phoenix
RUN mix local.hex --force && mix archive.install hex phx_new 1.4.10 --force

WORKDIR $WORK_DIR

COPY . $WORK_DIR
