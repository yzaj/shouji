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


11    重启解锁
12    打开 FW
13    打开 TL
14    更新 TL
15    退出 TL
16    切换账号

21    中间开始   （常用）
22    左下开始   （常用）
23    右下开始
24    中间停止
25    左下停止   （常用）
26    右下停止

31    重启
32    关机
33    截屏
34    安装 APK
35    Fastboot   （线刷）
36    Recovery


EOF

nums="$(seq "${READMAX}")"
readonly nums

for num in ${nums}; do
  color::read '请输入编号 [例如: 11]: ' 35 'projectnum'
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
