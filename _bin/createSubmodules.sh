#!/bin/bash

FOLDER_NAME[0]="andea240"
GIT_PATH[0]="https://github.com/amandersonyou/thesis"

FOLDER_NAME[1]="asarm379"
GIT_PATH[1]="https://github.com/marisaruizasari/thesis"

FOLDER_NAME[2]="dreya247"
GIT_PATH[2]="https://github.com/acdreyer/thesis"

FOLDER_NAME[3]="zeinn936"
GIT_PATH[3]="https://github.com/nourzein/thesis"

FOLDER_NAME[4]="grund302"
GIT_PATH[4]="https://github.com/dangrunebaum/thesis"

FOLDER_NAME[5]="noliver"
GIT_PATH[5]="https://github.com/neil-oliver/thesis"

FOLDER_NAME[6]="coenr936"
GIT_PATH[6]="https://github.com/robincoenen/thesis"

FOLDER_NAME[7]="huanx429"
GIT_PATH[7]="https://github.com/Xingwei726/MSthesis"

FOLDER_NAME[8]="tanea250"
GIT_PATH[8]="https://github.com/lulujordanna/thesis"

FOLDER_NAME[9]="desam815"
GIT_PATH[9]="https://github.com/mi-desai/thesis"

FOLDER_NAME[10]="shahs975"
GIT_PATH[10]="https://github.com/salonieshah/thesis"

FOLDER_NAME[11]="niy045"
GIT_PATH[11]="https://github.com/yiranni/thesis"

FOLDER_NAME[12]="caitlyn"
GIT_PATH[12]="https://github.com/caitlynmralph/thesis"

FOLDER_NAME[13]="mio"
GIT_PATH[13]="https://github.com/miopio/thesis-play"

FOLDER_NAME[14]="outwj058"
GIT_PATH[14]="https://github.com/joutwater/jo_berry_code"

FOLDER_NAME[15]="macdonab"
GIT_PATH[15]="https://github.com/joutwater/thesis"

FOLDER_NAME[16]="caix244"
GIT_PATH[16]="https://github.com/caixingyang1228/thesis_dv"

FOLDER_NAME[17]="zuic"
GIT_PATH[17]="https://github.com/azuic/unmask-mask"

FOLDER_NAME[18]="rand380"
GIT_PATH[18]="https://github.com/shuvitRan/msdv-thesis"

FOLDER_NAME[19]="yamanakj"
GIT_PATH[19]="https://github.com/jyamanaka/MajorStudio2"

echo "This script will"
echo "* Make 20 repositories"
echo "* Inside of $(pwd)"
echo ""
echo "Would you like to continue?"

read -p "(Y/N) " -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi

echo ""

for i in {0..19}; do
  # nicer file variables
  TEMP_FOLDER="${FOLDER_NAME[$i]}"
  TEMP_GIT="${GIT_PATH[$i]}"

  # create submodules for each student
  echo "creating:" $TEMP_FOLDER "..."

  git submodule add $TEMP_GIT $TEMP_FOLDER
done

echo "done!"
