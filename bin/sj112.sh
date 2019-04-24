#!/bin/bash
#
# 112区
set -euo pipefail

#### 常量 ####

#### 包含 ####

#### 函数 ####

#### 变量 ####
set +u
readonly projectnum="$1"
readonly qq="$2"
set -u

#### 主体 ####
if [[ -z "${projectnum}" ]]; then
  default
fi

if [[ "${projectnum}" == "11" ]]; then
  shouji.sh "${projectnum}" 
  exit
fi

case "${qq}" in
  1-1)
    default
    ;;
  1-2)
    default
    ;;
  2-1)
    default
    ;;
  2-2)
    default
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
    default
    ;;
  8-2)
    default
    ;;
  9-1)
    default
    ;;
  9-2)
    default
    ;;
  10-1)
    default
    ;;
  10-2)
    default
    ;;
  *)
    default
    ;;
esac
