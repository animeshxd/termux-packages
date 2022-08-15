export ANDROID_SDK_ROOT=/home/user/.local/opt/Android

ARCH=arm64-v8a #x86_64

# export CXXFLAGS="-02 -g"
$ANDROID_SDK_ROOT/cmake/3.22.1/bin/cmake \
    -DCMAKE_TOOLCHAIN_FILE=$ANDROID_SDK_ROOT/ndk/25.0.8775105/build/cmake/android.toolchain.cmake \
    -DANDROID_ABI=$ARCH \
    -DANDROID_PLATFORM=android-23 \
    -DANDROID_TOOLCHAIN=clang \
    -DCMAKE_BUILD_TYPE=MinSizeRel \
    -DOPENSSL_CRYPTO_LIBRARY=$ANDROID_SDK_ROOT/ndk-builds/21/$ARCH/lib/libcrypto.a \
    -DOPENSSL_SSL_LIBRARY=$ANDROID_SDK_ROOT/ndk-builds/21/$ARCH/lib/libssl.a \
    -DOPENSSL_INCLUDE_DIR=$ANDROID_SDK_ROOT/ndk-builds/21/$ARCH/include/ \
    -DCMAKE_INSTALL_PREFIX:PATH=../tdlib ..

    # -DTD_ENABLE_JNI=OFF \
    # -DANDROID=ON \
    # -DANDROID_STL=c++_static \

$ANDROID_SDK_ROOT/cmake/3.22.1/bin/cmake --build . --target tdjson -- -j8
echo "strip?"
read
$ANDROID_SDK_ROOT/ndk/25.0.8775105/toolchains/llvm/prebuilt/linux-x86_64/bin/llvm-strip libtdjson.so
