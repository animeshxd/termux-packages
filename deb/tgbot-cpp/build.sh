pkg update
pkg upgrade
pkg install clang --upgrade
pkg install git make cmake zlib openssl build-essential binutils boost
if [ ! -d "tgbot-cpp" ]; then
    git clone https://github.com/reo7sp/tgbot-cpp
fi
cd tgbot-cpp
rm build -rf
mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX:PATH=../../libtgbot
make -j4
make install
ls ../../libtgbot
