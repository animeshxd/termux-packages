pkg update -y
pkg upgrade -y
pkg install clang --upgrade -y
pkg install git make cmake zlib openssl php build-essential binutils boost -y
if [ ! -d "td" ]; then
    git clone https://github.com/tdlib/td.git
    cd td
else
    cd td
    git pull
fi

rm build -rf
mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=../../tdlib 
cmake --build . --target install
