#!/bin/bash

bundle check || bundle install

yarn install
>&2 echo "=========== YARN RUNNED"

if !(bundle exec rake db:migrate); then
  >&2 echo "=========== DATABASE DOES NOT EXIST... yet"
	bundle exec rake db:create
	>&2 echo "=========== DATABASE CREATED"
	bundle exec rake db:migrate
	>&2 echo "=========== DATABASE MIGRATED"
	bundle exec rake db:seed
	>&2 echo "=========== DATABASE SEEDED"
else
  >&2 echo "=========== DATABASE EXIST.... yay"
	bundle exec rake db:migrate
	>&2 echo "=========== DATABASE MIGRATED (already exists)"
fi

>&2 echo "=========== localhost:3000"
bundle exec rails s -p 3000 -b '0.0.0.0'