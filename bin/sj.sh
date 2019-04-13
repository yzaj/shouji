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
14    重启


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

color::countdown 5 35 '程序将在 ' 34 ' 秒后自动执行, 请停止操作' 34

color::timer 34 '成功: ' 32
