#!/bin/sh

if [ "$(uname -s)" = "Darwin" ]; then
  if [ "$(sysctl -nq hw.optional.arm64)" = "1" ]; then
    machine=arm64e
  else
    machine=x86_64
  fi
else
  machine=$(uname -m)
  case $machine in
    i?86)
      machine=x86
      ;;
    aarch64)
      machine=arm64
      ;;
  esac
fi

echo $machine
