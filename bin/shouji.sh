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

case "${projectnum}" in
  1)
    # 一键开机
    phone.sh ${phonenums} sleep:1
    ;;
  11)
    # 重启并解锁
    phone.sh ${phonenums} exit-fw,exit-tl,reboot,sleep:60,unlock
    ;;
  12)
    # 打开 FW
    phone.sh ${phonenums} start-fw,sleep:15,use-fw,sleep:10,run-fw
    ;;
  13)
    # 打开 TL
    phone.sh ${phonenums} start-tl
    ;;
  14)
    # 更新 TL
    phone.sh ${phonenums} update-tl
    ;;
  15)
    # 重启
    phone.sh ${phonenums} exit-fw,exit-tl,reboot
    ;;
  21)
    # 开始 中间
    phone.sh ${phonenums} right-center,sleep:5,play
    ;;
  22)
    # 停止 中间
    phone.sh ${phonenums} right-center,sleep:3,click
    ;;
  23)
    # 开始 左下
    phone.sh ${phonenums} left-lower,sleep:5,play
    ;;
  24)
    # 停止 左下
    phone.sh ${phonenums} left-lower,sleep:3,click
    ;;
  25)
    # 开始 右下
    phone.sh ${phonenums} right-lower,sleep:5,play
    ;;
  26)
    # 停止 右下
    phone.sh ${phonenums} right-lower,sleep:3,click
    ;;
  27)
    # 切换账号
    phone.sh ${phonenums} left-top,sleep:5,blue,sleep:10,white
    ;;
  *)
    err "${oneself##*/}: unrecognized option '${projectnum}'"
    exit "${E_UNRECOGNIZED_OPTION}"
    ;;
esac
