cd frameworks/base
git reset --hard && git clean -f -d
patch -p1 < ../../device/google/sprout-common/patch/signature_spoofing_permission.patch
git clean -f
cd ../..
cd system/netd
git reset --hard && git clean -f -d
patch -p1 < ../../device/google/sprout-common/patch/netd_fix_tethering.patch
cd ../..
cd bionic
git reset --hard && git clean -f -d
patch -p1 < ../device/google/sprout-common/patch/Apply-LIBC-version-to-__pthread_gettid.patch
cd ..

