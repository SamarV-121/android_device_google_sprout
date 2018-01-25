cd frameworks/base
git reset --hard && git clean -f -d
patch -p1 < ../../device/google/sprout-common/patch/signature_spoofing_permission.patch
git clean -f
cd ../..
