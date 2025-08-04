export NV_TARGET_BOARD=234
export CROSS_COMPILE_AARCH64_PATH=~/jetpack_5/aarch64--glibc--stable-2023.08-1
export CROSS_COMPILE_AARCH64=~/jetpack_5/aarch64--glibc--stable-2023.08-1/bin/aarch64-buildroot-linux-gnu-
export UEFI_STMM_PATH=~/jetpack_5/Linux_for_Tegra/bootloader/standalonemm_optee_t234.bin

make -C hello_world \
    CROSS_COMPILE="/home/michael/jetpack_5/aarch64--glibc--stable-2023.08-1/bin/aarch64-buildroot-linux-gnu-" \
    TA_DEV_KIT_DIR="/home/michael/jetpack_5/Linux_for_Tegra/sources/tegra/optee-src/nv-optee/optee/build/t234/export-ta_arm64/" \
    OPTEE_CLIENT_EXPORT="/home/michael/jetpack_5/Linux_for_Tegra/sources/tegra/optee-src/nv-optee/optee/install/t234/usr" \
    TEEC_EXPORT="/home/michael/jetpack_5/Linux_for_Tegra/sources/tegra/optee-src/nv-optee/optee/install/t234/usr" \
    -j"$(nproc)"
