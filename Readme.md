# Rails with Docker for development

This repo consists of two files to help you get up and running developing rails on unix based
systems using docker containers.

How to use these files:
- Download the two dockerfiles or clone the repo
- At the same level in the folder, create or move your app in. Ensure your database connections are
  configured correctly, see example YAML file below.
- You should have the two files and app/ folder at the same level.
- run `docker-compose build` - this will build the two required containers
- run `docker-compose up`
- now that your containers are spinning, in another terminal window (and as a one-off) run:
  `docker-compose run web rake db:create`

## Example database config YAML
```yaml
default: &default
  adapter: postgresql
  encoding: unicode
  host: db
  username: postgres
  password: postgres
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>

development:
  <<: *default
  database: myapp_development
  username: postgres
  password: postgres

test:
  <<: *default
  database: myapp_test
```
