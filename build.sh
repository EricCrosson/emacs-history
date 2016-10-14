rm -rf build
mkdir build
cd build
git init

release() {
    git rm -r * > /dev/null
    rm -rf *
    echo "-- Emacs $1: Deleted -----------"; ls; $bash
    tar xzf ../$2
    chmod -R u+w .
    echo "-- Emacs $1: Extracted -----------"; ls; $bash
    mv *$1/* .
    rmdir *$1
    echo "-- Emacs $1: Moved -----------"; ls; $bash
    git add -A .
    git commit -m "Emacs $1."
    git tag emacs-$1
}

apply_patch() {
    sh ../run-$1.sh
    echo "-- Emacs $1: Script -----------"; ls; $bash
    zcat ../$2 | patch -f -p1
    find . -name '*.orig' -o -name '*.rej' | xargs rm -f
    git add -A .
    echo "-- Emacs $1: Patched -----------"; ls; $bash
    git commit -m "Emacs $1."
    git tag emacs-$1
}

funet=ftp.funet.fi/pub/gnu/funet/historical-funet-gnu-area-from-early-1990s

release 16.56 ftp.splode.com/pub/users/friedman/emacs/emacs-16.56.tar.gz
release 18.41 bitsavers.org/bits/MIT/gnu/emacs_18.41.tar.gz
release 18.55 ftp4.gwdg.de/pub/msdos/editors/emacs/emacs-18.55.tar.gz
release 18.57 $funet/emacs/emacs-18.57.tar.gz
release 18.58 $funet/emacs/emacs-18.58.tar.gz
release 18.59 ftp.gnu.org/old-gnu/emacs/emacs-18.59.tar.gz
release 19.7 $funet/old/emacs-19.7.tar.gz
release 19.8 $funet/old/emacs-19.8.tar.gz
bash=bash
release 19.9 $funet/old/emacs-19.9.tar.gz
apply_patch 19.10 ftp.gnu.org/old-gnu/emacs/emacs-19.9-19.10.diff.gz
bash=""
apply_patch 19.11 ftp.gnu.org/old-gnu/emacs/emacs-19.10-19.11.diff.gz
apply_patch 19.12 ftp.gnu.org/old-gnu/emacs/emacs-19.11-19.12.diff.gz
apply_patch 19.13 ftp.gnu.org/old-gnu/emacs/emacs-19.12-19.13.diff.gz
apply_patch 19.14 ftp.gnu.org/old-gnu/emacs/emacs-19.13-19.14.diff.gz
apply_patch 19.15 ftp.gnu.org/old-gnu/emacs/emacs-19.14-19.15.diff.gz
apply_patch 19.16 ftp.gnu.org/old-gnu/emacs/emacs-19.15-19.16.diff.gz
release 19.17 $funet/old/emacs-19.17.tar.gz
release 19.18 $funet/old/emacs-19.18.tar.gz
release 19.19 $funet/old/emacs-19.19.tar.gz
release 19.20 $funet/old/emacs-19.20.tar.gz
release 19.21 $funet/old/emacs-19.21.tar.gz
release 19.22 $funet/emacs/emacs-19.22.tar.gz
release 19.23 $funet/emacs/emacs-19.23.tar.gz
release 19.24 $funet/emacs/emacs-19.24.tar.gz
release 19.25 $funet/emacs/emacs-19.25.tar.gz
release 19.26 $funet/emacs/emacs-19.26.tar.gz
release 19.27 $funet/emacs/emacs-19.27.tar.gz
release 19.28 $funet/emacs/emacs-19.28.tar.gz
release 19.29 ftp.tiscali.nl/pub/mirrors/sunfreeware/SOURCES/emacs-19.29.tar.gz
release 19.30 ftp.tiscali.nl/pub/mirrors/sunfreeware/SOURCES/emacs-19.30.tar.gz
release 19.31 mirrors.slackware.com/slackware/slackware-3.1/source/e/emacs-19.31.tar.gz
apply_patch 19.32 ftp.gnu.org/old-gnu/emacs/emacs-19.31-19.32.diff.gz
apply_patch 19.33 ftp.gnu.org/old-gnu/emacs/emacs-19.32-19.33.diff.gz
release 19.34 ftp.gnu.org/old-gnu/emacs/emacs-19.34b.tar.gz
