#!/bin/bash
#
# 141区
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
    shouji.sh "${projectnum}" 101-134
    ;;
  3-1)
    shouji.sh "${projectnum}" 101-118 131-132
    ;;
  4-1)
    shouji.sh "${projectnum}" 105-114 116-117 131
    ;;
  5-1)
    shouji.sh "${projectnum}" 101-134
    ;;
  6-1)
    shouji.sh "${projectnum}" 101-118 131-132
    ;;
  7-1)
    shouji.sh "${projectnum}" 101-114 117-118 126 131-132
    ;;
  *)
    err_uo
    ;;
esac
