ABI=x86_64 # arm64-v8a # https://developer.android.com/ndk/guides/cmake#android_abi

API_LEVEL=21
ANDROID_NDK_BUNDLE=/home/user/.local/opt/Android/ndk-bundle
export ANDROID_NDK_ROOT=/home/user/.local/opt/Android/ndk/25.0.8775105/
export PATH=$ANDROID_NDK_ROOT/toolchains/llvm/prebuilt/linux-x86_64/bin:$ANDROID_NDK_BUNDLE/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64/bin:$PATH
./Configure android-$ABI -D__ANDROID_API__=$API_LEVEL --prefix=/home/user/.local/opt/Android/ndk-builds-$API_LEVEL/$ABI/
make
