#!/bin/bash

find . -maxdepth 1 -mindepth 1 -type d | while read app; do
  if test -f "./${app}/latest-version.sh"; then
    version=$(bash "./${app}/latest-version.sh")
    echo "${version}" | tee "${app}/.version" > /dev/null
    echo "${app} ${version}"
  fi
done