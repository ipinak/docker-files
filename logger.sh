#!/bin/bash

RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
NC="\033[0m"

info() {
  echo "${1}"
}

success() {
  echo -e "${GREEN}${1}${NC}"
}

warning() {
  echo -e "${YELLOW}${1}${NC}"
}

error() {
  echo -e "${RED}${1}${NC}"
  exit 1
}
