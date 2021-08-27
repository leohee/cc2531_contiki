#!/bin/bash

OLDPWD=$(pwd)
RELDIR=$(cd $(dirname $BASH_SOURCE) && pwd)
cd $RELDIR

set -e

get_sdcc () {
	echo "rm old sdcc src"
	#rm -rf sdcc_src
	
	echo -n "svn checking out sdcc src ... "
#	svn co -r 9092 svn://svn.code.sf.net/p/sdcc/code/trunk/sdcc sdcc
	echo "checkout done."

	echo -n "patching ... "
#	sed -i 's/^\(MODELS = .*\)$/\1 huge/g' sdcc/device/lib/incl.mk
#	sed -i 's/^\(TARGETS\s*+=\s*models\s*\)small\(-.*\)$/\1model\2/g' sdcc/device/lib/Makefile.in
#	sed -i 's/-Werror//g' sdcc/support/sdbinutils/bfd/configure
#	sed -i 's/-Werror//g' sdcc/support/sdbinutils/bfd/warning.m4
#	sed -i 's/-Werror//g' sdcc/support/sdbinutils/binutils/configure
	echo "patch done."
}

compile_sdcc () {
	echo "rm old sdcc-install"
#	rm -rf sdcc-install

	mkdir -p sdcc-install
	cd sdcc-install
	TARGETPREFIX=$(pwd)

	cd ../sdcc_src
	echo -n "configure sdcc ... "	
	./configure --disable-gbz80-port --disable-z80-port --disable-ds390-port --disable-ds400-port --disable-pic14-port --disable-pic16-port --disable-hc08-port --disable-r2k-port --disable-z180-port --disable-sdcdb --disable-ucsim --prefix=$TARGETPREFIX
	echo "configure done."

	echo "compiling sdcc src ... "
	make || echo "ERROR exit" && exit 1

	echo "installing sdcc ... "
	make install
	echo "install done."
}

clean_sdcc () {
	echo -n "cleaning ... "
	cd sdcc_src
	make clean
	echo "clean done."
}

case "$1" in
	get)
		get_sdcc
	;;

	compile)
		compile_sdcc
	;;

	clean)
		clean_sdcc
	;;

	*)
		echo "Usage : ./compileSdcc.sh { get | compile | clean }"
		exit 1
	;;
esac


cd $OLDPWD


