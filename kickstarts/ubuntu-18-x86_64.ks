d-i debian-installer/locale string en_US
d-i console-setup/ask_detect boolean false
d-i keyboard-configuration/xkb-keymap select us
d-i keyboard-configuration/toggle select No toggling
d-i keyboard-configuration/layoutcode string us
d-i keyboard-configuration/variantcode string
d-i netcfg/choose_interface select auto
d-i netcfg/get_hostname string $myhostname
d-i time/zone string Asia/Shanghai
d-i clock-setup/utc boolean true
d-i clock-setup/ntp boolean true
d-i clock-setup/ntp-server  string pool.ntp.org
d-i mirror/country string manual
#d-i mirror/http/hostname string $http_server
#d-i mirror/http/directory string $install_source_directory
d-i mirror/http/hostname string mirrors.aliyun.com
d-i mirror/http/directory string /ubuntu
#d-i mirror/http/proxy string
d-i live-installer/net-image string http://$http_server/cobbler/links/$distro_name/install/filesystem.squashfs
d-i partman/choose_partition select finish
d-i partman/confirm boolean true
d-i partman/confirm_nooverwrite boolean true
d-i partman-auto/method string lvm
d-i partman-lvm/device_remove_lvm boolean true
d-i partman-lvm/confirm boolean true
d-i partman-lvm/confirm_nooverwrite boolean true
d-i partman-md/device_remove_md boolean true
d-i partman-partitioning/confirm_write_new_label boolean true
d-i partman-auto/choose_recipe select atomic
d-i passwd/root-login boolean true
d-i passwd/root-password-crypted password $default_password_crypted
d-i passwd/make-user boolean false
$SNIPPET('preseed_apt_repo_config')
tasksel tasksel/first multiselect standard
#d-i pkgsel/include string ntp ssh wget
#d-i grub-installer/grub2_instead_of_grub_legacy boolean true
d-i pkgsel/include string ssh
d-i grub-installer/only_debian boolean true
d-i grub-installer/bootdev string default
d-i debian-installer/add-kernel-opts string $kernel_options_post
d-i finish-install/reboot_in_progress note
d-i preseed/early_command string wget -O- \
   http://$http_server/cblr/svc/op/script/$what/$name/?script=preseed_early_default | \
   /bin/sh -s
d-i preseed/late_command string wget -O- \
   http://$http_server/cblr/svc/op/script/$what/$name/?script=preseed_late_default | \
   chroot /target /bin/sh -s
