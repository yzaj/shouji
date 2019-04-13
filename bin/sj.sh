#!/bin/bash
#
# 控制手机的交互
set -euo pipefail

#### 常量 ####
readonly ROOTDIR='/yzaj'

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

color::read '请输入编号: ' 36 'projectnum'











echo "${projectnum}"
