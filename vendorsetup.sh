cd bionic
git reset --hard && git clean -f -d
patch -p1 < ../device/google/sprout-common/patches/Apply-LIBC-version-to-__pthread_gettid.patch
cd ..

