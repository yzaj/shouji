#!/bin/bash
#
# 控制手机的方案
set -euo pipefail

#### 常量 ####
readonly E_UNRECOGNIZED_OPTION=2
readonly E_NOT_FOUND=127

#### 包含 ####

#### 函数 ####
err() {
  echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: $@" >&2
}

#### 变量 ####
readonly oneself="$0"
readonly projectnum="$1"

phonenums="$(echo "$@" | sed 's/^[0-9]\{1,\}[ \t]\{1,\}//g')"

set +u
phonenum="$2"
set -u

#### 主体 ####
if ! type phone.sh; then
  err "${oneself##*/}: phone.sh not found"
  exit "${E_NOT_FOUND}"
fi

if [[ -z "${phonenum}" ]]; then
  phonenum='all'
fi

readonly phonenum

case "${projectnum}" in
  1)
    :
    ;;
  2)
    phone.sh "${phonenum}" reboot,sleep:60,unlock
    ;;
  3)
    phone.sh "${phonenum}" start-fw,sleep:15,use-fw,sleep:10,run-fw
    ;;
  4)
    phone.sh "${phonenum}" start-tl,sleep:30,update-tl,sleep:15,skip-tl
    ;;
  5)
    phone.sh "${phonenum}" exit-tl,exit-fw
    ;;
  *)
    err "${oneself##*/}: unrecognized option '${projectnum}'"
    exit "${E_UNRECOGNIZED_OPTION}"
    ;;
esac
