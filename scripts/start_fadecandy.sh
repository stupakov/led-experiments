#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )"
$DIR/src/fadecandy/server/fcserver $DIR/config/fadecandy-config.json &
