#!/usr/bin/env bash

if [[ ! -e ./db/trac.db ]]; then
  rm -rf ./*
  trac-admin ./ initenv OpenSwitch sqlite:db/trac.db --inherit=/trac.ini
  cp /OpenSwitch.png /trac/htdocs/
fi

tracd --port 8000 -s ./
