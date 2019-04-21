#!/bin/bash
#
# 控制手机的交互
set -euo pipefail

#### 常量 ####
readonly ROOTDIR='/yzaj'
readonly READMAX=10
readonly E_OPERATION_FAILED=3

#### 包含 ####
. "${ROOTDIR}"/shell/lib/color.sh

#### 函数 ####

#### 变量 ####

#### 主体 ####
clear

cat <<-'EOF'
正在控制手机:


 1    一键开机

11    重启并解锁
12    打开 FW
13    打开 TL

14    更新 TL
15    重启

21    开始 中间   （常用）
22    停止 中间

23    开始 左下   （常用）
24    停止 左下   （常用）

25    开始 右下
26    停止 右下
27    切换账号


EOF

nums="$(seq "${READMAX}")"
readonly nums

for num in ${nums}; do
  color::read '请输入编号: ' 35 'projectnum'
  echo ''
  
  if [[ "${projectnum}" =~ ^[0-9]{1,}$ ]]; then
    break
  fi
  
  if [[ "${num}" == "${READMAX}" ]]; then
    color::echo '错误: 超出可输入次数, 程序已中止' 31
    exit "${E_OPERATION_FAILED}"
  fi
done

readonly projectnum

color::countdown 5 35 '程序将在 ' 34 ' 秒后自动执行, 请停止操作' 34

shouji.sh "${projectnum}" all

echo ''
color::timer 34 '已完成! 耗时: ' 32
