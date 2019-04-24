#!/bin/bash
#
# 主程序
set -euo pipefail

. "${bindir}"/remotefunc.sh
. "${bindir}"/remotearg.sh

# 选择配置
if [[ -d "${updir}" ]]; then
  rm -r "${updir}"
fi

cp -r "${condir}"/upload "${tempdir}"

for qqbatch in ${qqbatchs}; do
  case "${qq}" in
    all)
      cpall "${qqbatchs}" "${qqbatch}"
      ;;
    1-1)
      cpbatch 1 "${qq}" "${qqbatch}"
      ;;
    1-2)
      cpbatch 2 "${qq}" "${qqbatch}"
      ;;
    2-1)
      cpbatch 3 "${qq}" "${qqbatch}"
      ;;
    2-2)
      cpbatch 4 "${qq}" "${qqbatch}"
      ;;
    3-1)
      cpbatch 5 "${qq}" "${qqbatch}"
      ;;
    3-2)
      cpbatch 6 "${qq}" "${qqbatch}"
      ;;
    4-1)
      cpbatch 7 "${qq}" "${qqbatch}"
      ;;
    4-2)
      cpbatch 8 "${qq}" "${qqbatch}"
      ;;
    5-1)
      cpbatch 9 "${qq}" "${qqbatch}"
      ;;
    5-2)
      cpbatch 10 "${qq}" "${qqbatch}"
      ;;
    6-1)
      cpbatch 11 "${qq}" "${qqbatch}"
      ;;
    6-2)
      cpbatch 12 "${qq}" "${qqbatch}"
      ;;
    7-1)
      cpbatch 13 "${qq}" "${qqbatch}"
      ;;
    7-2)
      cpbatch 14 "${qq}" "${qqbatch}"
      ;;
    8-1)
      cpbatch 15 "${qq}" "${qqbatch}"
      ;;
    8-2)
      cpbatch 16 "${qq}" "${qqbatch}"
      ;;
    9-1)
      cpbatch 17 "${qq}" "${qqbatch}"
      ;;
    9-2)
      cpbatch 18 "${qq}" "${qqbatch}"
      ;;
    10-1)
      cpbatch 19 "${qq}" "${qqbatch}"
      ;;
    10-2)
      cpbatch 20 "${qq}" "${qqbatch}"
      ;;
    *)
      :
      ;;
  esac
done

for rmset in ${RMSETS}; do
  rmset_path="${condir}/master-all/set${rmset}.ini"
  
  if [[ -f "${rmset_path}" ]]; then
    rm "${rmset_path}"
  fi
done

# 记录任务
mkdir -p "${taskdir}"

if [[ -f "${beforetask}" ]]; then
  rm "${beforetask}"
fi

if [[ "${qq}" != "all" ]]; then
  for qqbatch in ${qqbatchs}; do
    
    if [[ -f "${todaytask}" ]]; then
      sed -i "/^${qq} ${qqbatch}/d" "${todaytask}"
    fi
    
    echo "${qq} ${qqbatch} ${tasktime}" >> "${todaytask}"
    
  done
fi

# 修改配置
. "${bindir}"/config_upload.sh

# 上传配置, DOS 命令
cd "${updir}"

sleep 1
start remote-config.exe

sleep 1
start remote-upload.exe
