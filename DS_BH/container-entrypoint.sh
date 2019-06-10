#!/bin/bash
PATH=$PATH:/usr/sbin

set -e

if [ "$1" = "prod" ]; then
  exec python /data/src/main.py
elif [ "$1" = "test" ]; then
  exec pytest /data/src
fi