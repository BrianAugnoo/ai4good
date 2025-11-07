#!/usr/bin/env bash
# exit on error
set -o errexit

# Installe les dépendances Ruby et Node
bundle install
yarn install --check-files

# Compile les fichiers CSS et JS
yarn build:css
yarn build

# Précompile les assets Rails
bundle exec rails assets:precompile
bundle exec rails assets:clean
bundle exec rails db:prepare

# If you have a paid instance type, we recommend moving
# database migrations like this one from the build command
# to the pre-deploy command:
bin/rails db:migrate
