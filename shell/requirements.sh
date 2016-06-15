#!/usr/bin/env bash
# Assumes OSX at or greater than Yosemite
# Assumes you are not rootless root
# Assumes brew is installed

## Declare versions comparing
vercmp() {
  local a="$1" b="$2"
  local -i fa fb

  while true; do

    fa="${a%%.*}"
    fb="${b%%.*}"

    ((fa != fb)) && break

    a="${a#$fa}"; a="${a#.}"
    b="${b#$fb}"; b="${b#.}"

    if [[ -z $a && -z $b ]]; then
      echo 0 ; return 0
    fi

  done

  ((fa > fb)) && echo 1 || echo -1
}


## Test and install Python if not available
if ! $(which python |grep 'python is' |head -n1) ; then
  brew install python ## python ~2.7, python3 is the ~3.x package
fi


## Test correct version, do not force upgrade incase they are at ~3.x
if [[ $(vercmp $(python --version 2>&1 |awk '{print$2}') 2.7) -lt 0 ]]; then
  echo "Python version is under 2.7, please upgrade it..." ; return 1
fi


## Test and install PIP if not available
if ! $(which pip |grep 'pip is' |head -n1) ; then
  echo "Something broke with PIP install, exiting..." ; return 1
fi
