#!/bin/bash
#
# 97区
set -euo pipefail

#### 常量 ####
readonly ROOTDIR='/yzaj'
readonly E_UNRECOGNIZED_OPTION=2

#### 包含 ####

#### 函数 ####
err() {
  echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: $@" >&2
}

# 功  能: 
# 使  用: 
# 参数 1: 
# 返回值: 
# 备  注: 该函数的使用范围受限
err_uo() {
  sed -n 25,52p "${ROOTDIR}"/shouji/bin/sj.sh
  
  err "${oneself##*/}: unrecognized option '${qq}'"
  exit "${E_UNRECOGNIZED_OPTION}"
}

#### 变量 ####
readonly oneself="$0"

set +u
readonly projectnum="$1"
qq="$2"
set -u

#### 主体 ####
if [[ -z "${projectnum}" ]]; then
  err_uo
fi

if [[ "${projectnum}" == "11" ]]; then
  qq='a'
fi

readonly qq

case "${qq}" in
  a)
    shouji.sh "${projectnum}" 101-104 115-116 118-130 132-134
    ;;
  3-1)
    shouji.sh "${projectnum}" 119-130 133-134
    ;;
  4-1)
    shouji.sh "${projectnum}" 101-104 115 118-130 132-134
    ;;
  6-1)
    shouji.sh "${projectnum}" 119-130 133-134
    ;;
  7-1)
    shouji.sh "${projectnum}" 115-116 119-125 127-130 133-134
    ;;
  *)
    err_uo
    ;;
esac
