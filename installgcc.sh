set -eux
version="$1"
wget -c https://ftp.gnu.org/gnu/gcc/gcc-"$version"/gcc-"$version".tar.bz2
tar -xjf gcc-"$version".tar.bz2
cd gcc-"$version"
./contrib/download_prerequisites
cd ..
mkdir gcc-"$version"-build
cd gcc-"$version"-build
$PWD/../gcc-"$version"/configure --prefix=$HOME/toolchains --enable-languages=c,c++,fortran --disable-multilib
make -j$(nproc)
make install
