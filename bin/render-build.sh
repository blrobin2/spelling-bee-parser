#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
SECRET_KEY_BASE_DUMMY=1 ./bin/rails assets:precompile
SECRET_KEY_BASE_DUMMY=1 ./bin/rails assets:clean