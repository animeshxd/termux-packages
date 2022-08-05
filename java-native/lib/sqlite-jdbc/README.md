####
 ```sh
 
 # dependencies 
 apt install clang openjdk-17 perl maven make curl unzip git
 
 # 1
 git clone https://github.com/xerial/sqlite-jdbc
 cd sqlite-jdbc

 # Fix PREFIX
 sed -i 's/\/tmp\//\/data\/data\/com.termux\/files\/usr\/tmp\//g' Makefile
 

 # Fix make native
 # sed -i 's/CCFLAGS:=/CCFLAGS:= -lm/g' Makefile
 # compile
 # make -j7


 # compile 
 make native CCFLAGS="-lm -fPIC" -j7
 # test
 mvn test
 

 # install with maven ( full jar )
 mvn install

 # or install by copying to library path
 mkdir -p $PREFIX/java/packages/lib/
 cp target/sqlite-*-Linux*/*.so $PREFIX/java/packages/lib
 ```