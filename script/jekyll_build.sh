#!/bin/bash
CONFIG_FILE="_prod_config"

set -x
cd $(dirname "${BASH_SOURCE}")
jekyll clean
jekyll build --config _prod_config.yml
