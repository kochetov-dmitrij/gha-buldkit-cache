FROM nginx

RUN --mount=type=cache,target=/test_cache_folder_1/ --mount=type=cache,target=/test_cache_folder_2/  echo `date` >> /test_cache_folder_1/test_cache.txt && echo `date` >> /test_cache_folder_2/test_cache.txt

## Dockerfile of the main application (rails app)
#
## jdk is for compiling our forked activerecord-jdbcpostgresql-adapter
#FROM jruby:9.2.17-jdk8 AS app_base
#
### Install node and yarn
## From https://github.com/nodejs/docker-node/blob/1d6a051d71e817f3947612a260ddcb02e48c2f74/14/alpine3.12/Dockerfile
#
#RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash -
#RUN apt-get install -y nodejs build-essential git
#RUN npm install --global yarn@1.22.10
#
#FROM app_base AS app_dev
#
#ENV EDITOR=nano
#ENV DEBUG='express:*'
##ENV JRUBY_OPTS="-J-Xmn128m -J-Xms256m -J-Xmx256m"
#
## For rails db:schema:dump we need pg_dump
#
#RUN sh -c 'echo " deb http://apt.postgresql.org/pub/repos/apt/ buster-pgdg main " >> /etc/apt/sources.list.d/pgdg.list'
#RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
#RUN apt-get --allow-releaseinfo-change update
#RUN apt-get -y install postgresql-12
#
#WORKDIR /var/www/app_name/
#CMD [ "sleep", "infinity" ]
#
### Bundle and yarn
#FROM app_base AS app_bundle
#
#ENV RAILS_ROOT /var/www/app_name
#RUN mkdir -p $RAILS_ROOT
#
#WORKDIR $RAILS_ROOT
#
#COPY Gemfile .
#COPY Gemfile.lock .
#RUN bundle config set deployment 'true'
#RUN bundle config set without 'development test'
#RUN bundle config set jobs '20'
#RUN bundle config set retry '5'
#RUN bundle install
#
#FROM app_bundle AS app_deps
#
#COPY package.json .
#COPY yarn.lock .
#RUN yarn install --production --frozen-lockfile
#
#
#FROM app_deps AS app_assets
#
#ARG RAILS_ENV
#ENV RAILS_ENV $RAILS_ENV
#
#ARG RAILS_MASTER_KEY
#ENV RAILS_MASTER_KEY $RAILS_MASTER_KEY
#
#RUN wget https://s3.amazonaws.com/rds-downloads/rds-combined-ca-bundle.pem
#
#COPY . .
#
#RUN NODE_OPTIONS="--max_old_space_size=4096" bundle exec rake assets:precompile
#
##build exporter template
#RUN NODE_OPTIONS="--max_old_space_size=4096" node tools/buildExportTemplate.js --rebuild -o app/assets/exported.html
#
#FROM app_assets AS app
#
#RUN rm -r node_modules
#
#EXPOSE 3000
#
#CMD ["bundle", "exec", "rails", "server"]
#
#RUN --mount=type=bind,source=,target=/centos ls /centos > /root/centos.txt
