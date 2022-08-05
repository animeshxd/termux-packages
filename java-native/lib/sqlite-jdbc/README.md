####
 ```sh
 
 # dependencies 
 apt install clang openjdk-17 perl maven make curl unzip git
 
 # 1
 git clone https://github.com/xerial/sqlite-jdbc
 cd sqlite-jdbc

 # Fix
 sed -i 's/CCFLAGS:=/CCFLAGS:= -lm/g' Makefile

 # compile
 make -j7
 mvn test
 
 # install with maven ( full jar )
 mvn install

 # or install by copying to library path
 mkdir -p $PREFIX/java/packages/lib/
 cp target/sqlite-*-Linux*/*.so $PREFIX/java/packages/lib
 ```
