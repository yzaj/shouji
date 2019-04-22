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
  11)
    # 重启解锁
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
    # 退出 TL
    phone.sh ${phonenums} exit-tl
    ;;
  16)
    # 切换账号
    phone.sh ${phonenums} left-top,sleep:5,blue,sleep:10,white
    ;;
  21)
    # 中间开始
    phone.sh ${phonenums} right-center,sleep:5,play
    ;;
  22)
    # 左下开始
    phone.sh ${phonenums} left-lower,sleep:5,play
    ;;
  23)
    # 右下开始
    phone.sh ${phonenums} right-lower,sleep:5,play
    ;;
  24)
    # 中间停止
    phone.sh ${phonenums} right-center,sleep:3,click
    ;;
  25)
    # 左下停止
    phone.sh ${phonenums} left-lower,sleep:3,click
    ;;
  26)
    # 右下停止
    phone.sh ${phonenums} right-lower,sleep:3,click
    ;;
  31)
    # 重启
    phone.sh ${phonenums} exit-fw,exit-tl,reboot
    ;;
  32)
    # 关机
    phone.sh ${phonenums} exit-fw,exit-tl,halt
    ;;
  33)
    # 截屏
    phone.sh ${phonenums} screencap
    ;;
  34)
    # 安装 APK
    phone.sh ${phonenums} apk
    ;;
  35)
    # Fastboot
    phone.sh ${phonenums} bootloader
    ;;
  36)
    # Recovery
    phone.sh ${phonenums} recovery
    ;;
  *)
    err "${oneself##*/}: unrecognized option '${projectnum}'"
    exit "${E_UNRECOGNIZED_OPTION}"
    ;;
esac
