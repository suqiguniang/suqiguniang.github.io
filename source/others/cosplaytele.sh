#!/bin/sh  
RED='\033[1;31m'
GREED='\033[1;32m'
YELLO='\033[1;33m'
BLUE='\033[1;34m'
MEIMEI='\033[1;35m'
SKYBLUE='\033[1;36m'
BAI='\033[1;37m'
NOCOLOR='\033[0m'
#============ get the file name ===========  
Folder_A="/vol2/1000/sata/H/other"  
rename 's/ /-/g' ${Folder_A}/*
filescunzai=$(ls /vol2/1000/sata/H/other/*.rar | wc -l)
if [ "$filescunzai" != "0" ] ; then
  for file_a in ${Folder_A}/*.rar
  do
    temp_file=`basename $file_a`  
    echo  ${GREED}"\n--"${temp_file}"--\n开始解压文件"${NOCOLOR}
    unrar x -o-q -pcosplaytele ${file_a} /vol2/1000/sata/H/cosplaytele/
    echo ${BLUE}"\n文件解压完成，准备删除文件\n--"${temp_file}"--\n"
    rm ${file_a}
    echo "文件删除完成\n"${NOCOLOR}
  done
else
    echo ${RED}"$filecunzai not extit"${NOCOLOR}
fi
