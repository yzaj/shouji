#!/bin/bash
#
# 控制手机的方案
set -euo pipefail

#### 常量 ####
readonly E_NOT_FOUND=127

#### 包含 ####

#### 函数 ####
err() {
  echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: $@" >&2
}

#### 变量 ####
readonly oneself="$0"
readonly projectnum="$1"
phonenums="$(echo "$@" | sed 's/^[0-9]\{1,\}//g')"

#### 主体 ####
if ! type phone.sh; then
  err "${oneself##*/}: phone.sh not found"
  exit "${E_NOT_FOUND}"
fi

if [[ -z "${phonenums}" ]]; then
  phonenums='all'
fi

readonly phonenums


















echo "${projectnum}"
echo "${phonenums}"
