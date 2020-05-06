#!/bin/env bash

set -e 
set -x

organization=decidim  
branch=develop

sed -i "4s;.*;organization = '${organization}';" Gemfile
sed -i "5s;.*;branch = '${branch}';" Gemfile

echo "CHECKING OUT"
docker-compose run --rm app bundle update

echo "DB CLEANING UP"
docker-compose run --rm app bundle exec rails db:drop
docker-compose run --rm app bundle exec rails db:create
docker-compose run --rm app bundle exec rails decidim:upgrade
docker-compose run --rm app bundle exec rails db:migrate
docker-compose run --rm app bundle exec rails db:seed

echo "STARTING UP"
docker-compose up

echo "CODE CLEANING UP"
git checkout -b review/feature/${branch}
git add .
git commit -m "Review for feature/${branch}"
git checkout master

echo "FINISH"

