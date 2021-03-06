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
    phone.sh ${phonenums} exit-fw,exit-tl,reboot,sleep:50,sleep:60,unlock
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
    phone.sh ${phonenums} annc,left-top,sleep:5,blue,sleep:10,white
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
    phone.sh ${phonenums} right-center
    ;;
  25)
    # 左下停止
    phone.sh ${phonenums} left-lower
    ;;
  26)
    # 右下停止
    phone.sh ${phonenums} right-lower
    ;;
  31)
    # 重启
    phone.sh ${phonenums} exit-fw,exit-tl,reboot
    ;;
  32)
    # 解锁
    phone.sh ${phonenums} unlock
    ;;
  33)
    # 关机
    phone.sh ${phonenums} exit-fw,exit-tl,halt
    ;;
  34)
    # 截屏
    phone.sh ${phonenums} screencap
    ;;
  35)
    # 安装 APK
    phone.sh ${phonenums} apk
    ;;
  36)
    # Fastboot
    phone.sh ${phonenums} bootloader
    ;;
  37)
    # Recovery
    phone.sh ${phonenums} recovery
    ;;
  41)
    # 关闭公告
    phone.sh ${phonenums} annc
    ;;
  42)
    # 进入 TL
    phone.sh ${phonenums} enter-tl,sleep:5,enter-tl2
    ;;
  43)
    # 关闭广告
    phone.sh ${phonenums} ad
    ;;
  44)
    # 打开背包
    phone.sh ${phonenums} backpack
    ;;
  45)
    # 关闭 4G
    phone.sh ${phonenums} g4
    ;;
  *)
    err "${oneself##*/}: unrecognized option '${projectnum}'"
    exit "${E_UNRECOGNIZED_OPTION}"
    ;;
esac
