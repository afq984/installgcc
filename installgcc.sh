set -eux
version=9.1.0
wget -c https://ftp.gnu.org/gnu/gcc/gcc-"$version"/gcc-"$version".tar.gz
tar -xzf gcc-"$version".tar.gz
cd gcc-"$version"
./contrib/download_prerequisites
cd ..
mkdir gcc-"$version"-build
cd gcc-"$version"-build
$PWD/../gcc-"$version"/configure --prefix=$HOME/toolchains/gcc-"$version" --enable-languages=c,c++,fortran --disable-multilib --disable-bootstrap
time make -j$(nproc) > /dev/null
