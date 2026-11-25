#!/bin/sh
set -e
cd "$(dirname "$0")"
mkdir -p esp/EFI/BOOT esp/boot/grub
grub-mkstandalone -O x86_64-efi \
  -o esp/EFI/BOOT/BOOTX64.EFI \
  --modules="part_gpt part_msdos fat search search_fs_file all_video gfxterm gfxmenu png font normal configfile" \
  "boot/grub/grub.cfg=embed.cfg"
