#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:83886080:f1a32ab2153f1998f9e19ac3cd111d3628dcdfc2; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:100663296:8ff23f83515f287b1b617cc0ba310b340cd3c451 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:83886080:f1a32ab2153f1998f9e19ac3cd111d3628dcdfc2 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
