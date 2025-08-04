export NV_TARGET_BOARD=234
export CROSS_COMPILE_AARCH64_PATH=~/michael/aarch64--glibc--stable-2023.11-1
export CROSS_COMPILE_AARCH64=~/michael/aarch64--glibc--stable-2023.11-1/bin/aarch64-buildroot-linux-gnu-
export UEFI_STMM_PATH=~/optee-dependencies/Jetson_Linux_R35.4.1_aarch64/Linux_for_Tegra/bootloader/standalonemm_optee_t234.bin


make -C hello_world \
	CROSS_COMPILE="/home/nick2/michael/aarch64--glibc--stable-2023.11-1/bin/aarch64-buildroot-linux-gnu-" \
	TA_DEV_KIT_DIR="/home/nick2/optee-dependencies/Jetson_Linux_R35.4.1_aarch64/Linux_for_Tegra/sources/tegra/optee-src/nv-optee/optee/build/t234/export-ta_arm64/" \
	OPTEE_CLIENT_EXPORT="/home/nick2/optee-dependencies/Jetson_Linux_R35.4.1_aarch64/Linux_for_Tegra/sources/tegra/optee-src/nv-optee/optee/install/t234/usr" \
	TEEC_EXPORT="/home/nick2/optee-dependencies/Jetson_Linux_R35.4.1_aarch64/Linux_for_Tegra/sources/tegra/optee-src/nv-optee/optee/install/t234/usr" \
	-j"$(nproc)"