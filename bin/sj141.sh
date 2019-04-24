#!/bin/bash
#
# 112区
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
  sed -n 25,45p "${ROOTDIR}"/shouji/bin/sj.sh
  
  err "${oneself##*/}: unrecognized option '${qq}'"
  exit "${E_UNRECOGNIZED_OPTION}"
}

#### 变量 ####
readonly oneself="$0"

set +u
readonly projectnum="$1"
readonly qq="$2"
set -u

#### 主体 ####
if [[ -z "${projectnum}" ]]; then
  err_uo
fi

if [[ "${projectnum}" == "11" ]]; then
  shouji.sh "${projectnum}" 
  exit
fi

case "${qq}" in
  1-1)
    err_uo
    ;;
  1-2)
    err_uo
    ;;
  2-1)
    err_uo
    ;;
  2-2)
    err_uo
    ;;
  3-1)
    shouji.sh "${projectnum}" 
    ;;
  3-2)
    shouji.sh "${projectnum}" 
    ;;
  4-1)
    shouji.sh "${projectnum}" 
    ;;
  4-2)
    shouji.sh "${projectnum}" 
    ;;
  5-1)
    shouji.sh "${projectnum}" 
    ;;
  5-2)
    shouji.sh "${projectnum}" 
    ;;
  6-1)
    shouji.sh "${projectnum}" 
    ;;
  6-2)
    shouji.sh "${projectnum}" 
    ;;
  7-1)
    shouji.sh "${projectnum}" 
    ;;
  7-2)
    shouji.sh "${projectnum}" 
    ;;
  8-1)
    err_uo
    ;;
  8-2)
    err_uo
    ;;
  9-1)
    err_uo
    ;;
  9-2)
    err_uo
    ;;
  10-1)
    err_uo
    ;;
  10-2)
    err_uo
    ;;
  *)
    err_uo
    ;;
esac
