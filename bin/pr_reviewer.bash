#!/bin/env bash

set -e 
set -x

organization=decidim  
branch=develop
drop_database=0

while [[ "$#" -gt 0 ]]; do
    case $1 in
        -o|--organization) organization="$2"; shift ;;
        -b|--branch) branch="$2"; shift ;;
        -s|--short) short="$2"; shift ;;
        -d|--drop_database) drop_database=1 ;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

if [[ -n ${short} ]] ; then
  organization=$(echo $short | tr ":" " " | cut -d " " -f1)
  branch=$(echo $short | tr ":" " " | cut -d " " -f2)
fi

sed -i "4s;.*;organization = '${organization}';" Gemfile
sed -i "5s;.*;branch = '${branch}';" Gemfile

echo "CHECKING OUT"
docker-compose run --rm app bundle update

if [[ $drop_database == 1 ]] ; then
  echo "DB CLEANING UP"
  docker-compose run --rm app bundle exec rails db:drop
  docker-compose run --rm app bundle exec rails db:create
  docker-compose run --rm app bundle exec rails decidim:upgrade
  docker-compose run --rm app bundle exec rails db:migrate
  docker-compose run --rm app bundle exec rails db:seed
fi

echo "STARTING UP"
docker-compose up

echo "CODE CLEANING UP"
now=$(date +"%Y%m%d-%H%M")
git checkout -b review/feature/${branch}-${now}
git add .
git commit -m "Review for feature/${branch}"
git checkout master

echo "FINISH"
