#!/usr/bin/env bash

version="1.4.1"
version="${version#*v}"
version="${version#*release-}"
printf "%s" "${version}"
