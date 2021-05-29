#### local installation


# How to create a rails app inside docker
- create the app folder

- create *Gemfile* file

- add to top line
```
source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }
```

- add rails gem
```
gem 'rails', '~> 6.1', '>= 6.1.3.2'
```

- create *Gemfile.lock* file

- create *Dockerfile* file
```
FROM ruby:2.7.0

RUN apt-get update && apt-get install -y build-essential
RUN apt-get install default-libmysqlclient-dev libpq-dev

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD . $app
```

- create *docker-compose.yml* file
```
version: '3'
services:
  db:
    image: mysql:5.7
    restart: always
    volumes:
      - mysql-data:/var/lib/mysql:rw
    environment:
      MYSQL_ROOT_PASSWORD: secret
      MYSQL_DATABASE: app_db
      MYSQL_USER: app_user
      MYSQL_PASSWORD: secret
    ports:
      - '3306:3306'

  app:
    build: .
    command: bundle exec rails s -p 3000 -b '0.0.0.0'
    volumes:
      - .:/app
      - bundle-path:/bundle
    ports:
      - '3000:3000'
    depends_on:
      - db
    environment:
      BUNDLE_PATH: /bundle/vendor
      DB_NAME: app_db
      DB_USER: root
      DB_PASS: secret
      DB_HOST: db
    networks:
      default:
        ipv4_address: 10.10.10.10

volumes:
  mysql-data:
  bundle-path:

networks:
  default:
    external:
      name: red-network

```

- setup the containers and create rails app
```
docker-compose run app bundle install
docker-compose run app bundle exec rails new . --force --webpack --database=mysql --skip-bundle
```

- update *database.yml*
```
default: &default
  adapter: mysql2
  encoding: utf8
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  database: <%= ENV['DB_NAME'] %>
  username: <%= ENV['DB_USER'] %>
  password: <%= ENV['DB_PASS'] %>
  host: <%= ENV['DB_HOST'] %>

development:
  <<: *default

test:
  <<: *default

production:
  <<: *default
```

- update *docker-compose.yml* setup environment variables for database name,user,pass,host

- build the image
```
docker-compose build
```

- run the app
```
docker-compose up
```





