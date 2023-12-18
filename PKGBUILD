# Contributor abcd567
# Maintainer abcd567

pkgname=aiscatcher
pkgver=latest
pkgrel=0
arch=('aarch64' 'arm64')
source=('aiscatcher::git+https://github.com/jvde-github/AIS-catcher.git'
        'aiscatcher.service'
        'aiscatcher.conf'
        'start-ais.sh'
        'rtl-sdr.rules')

cksums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

install=aiscatcher.install

makedepends=('git' 'make' 'gcc' 'cmake' 'pkg-config' 'rtl-sdr' 'openssl')

pkgver() {
  cd ${srcdir}/aiscatcher
  git describe --tags | sed 's/-/./' | sed 's/-.*//'
}

backup=(usr/share/aiscatcher/aiscatcher.conf)

build(){
cd aiscatcher
mkdir -p build
cd build
cmake ..
make
}

package(){
install -Dm755 ${srcdir}/aiscatcher/build/AIS-catcher ${pkgdir}/usr/local/bin/AIS-catcher
install -Dm755 ${srcdir}/start-ais.sh ${pkgdir}/usr/share/aiscatcher/start-ais.sh
install -Dm644 ${srcdir}/aiscatcher.service ${pkgdir}/usr/lib/systemd/system/aiscatcher.service
install -Dm644 ${srcdir}/aiscatcher.conf ${pkgdir}/usr/share/aiscatcher/aiscatcher.conf
install -dm644 ${pkgdir}/usr/share/aiscatcher/plugins
cp ${srcdir}/aiscatcher/plugins/* ${pkgdir}/usr/share/aiscatcher/plugins/
install -D -m644 ${srcdir}/rtl-sdr.rules ${pkgdir}/etc/udev/rules.d/ais-rtl-sdr.rules
}


