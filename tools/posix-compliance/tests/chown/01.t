#!/bin/sh
# $FreeBSD: src/tools/regression/fstest/tests/chown/01.t,v 1.1 2007/01/17 01:42:08 pjd Exp $

desc="chown returns ENOTDIR if a component of the path prefix is not a directory"

dir=`dirname $0`
. ${dir}/../misc.sh

echo "1..5"

n0=`namegen`
n1=`namegen`

expect 0 mkdir ${n0} 0755
expect 0 create ${n0}/${n1} 0644
expect ENOTDIR chown ${n0}/${n1}/test 65534 65534
expect 0 unlink ${n0}/${n1}
expect 0 rmdir ${n0}
