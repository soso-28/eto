#!/bin/bash
# SPDX-FileCopyrightText: 2026 Soya Yuzawa
# SPDX-License-Identifier: BSD-3-Clause

ng () {
        echo ${1}行目のテスト失敗
        res=1
}

res=0

### NORMAL INPUT ###
out=$(echo "2004-05-15" | ./eto)
[ "$?" = 0 ]      || ng "$LINENO"
[ "${out}" = "申" ] || ng "$LINENO"

out=$(echo "2026" | ./eto)
[ "$?" = 0 ]      || ng "$LINENO"
[ "${out}" = "午" ] || ng "$LINENO"

out=$(echo "2026" | ./eto -y)
[ "$?" = 0 ]      || ng "$LINENO"
[ "${out}" = "うま" ] || ng "$LINENO"

out=$(echo "2004-05-15" | ./eto --yomi)
[ "$?" = 0 ]      || ng "$LINENO"
[ "${out}" = "さる" ] || ng "$LINENO"

### STRANGE INPUT ###
out=$(echo あ | ./eto)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo | ./eto)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo 0 | ./eto)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo "2026" | ./eto -z 2>/dev/null)
[ "$?" = 2 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

[ "${res}" = 0 ] && echo OK
exit $res
