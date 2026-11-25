#!/bin/sh
set -e
cd "$(dirname "$0")"

mkdir -p esp/boot/grub/themes/libreboot
cp grub.cfg esp/boot/grub/grub.cfg
cp -r theme/. esp/boot/grub/themes/libreboot/

[ -f OVMF_VARS.fd ] || cp /usr/share/edk2/x64/OVMF_VARS.4m.fd OVMF_VARS.fd

qemu-system-x86_64 -enable-kvm -m 512 \
  -drive if=pflash,format=raw,readonly=on,file=/usr/share/edk2/x64/OVMF_CODE.4m.fd \
  -drive if=pflash,format=raw,file=OVMF_VARS.fd \
  -drive file=fat:rw:esp,format=raw
