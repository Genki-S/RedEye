#!/bin/sh

# set config vars
heroku config:set OMNIAUTH_PROVIDER_KEY=$OMNIAUTH_PROVIDER_KEY
heroku config:set OMNIAUTH_PROVIDER_SECRET=$OMNIAUTH_PROVIDER_SECRET

git push heroku master
