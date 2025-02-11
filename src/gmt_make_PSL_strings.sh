#!/usr/bin/env bash
#
# Copyright (c) 2012-2019 by the GMT Team (https://www.generic-mapping-tools.org/team.html)
# See LICENSE.TXT file for copying and redistribution conditions.
#
# This script just makes the include file PSL_strings.h
# used by postscriptlight.h
#
COPY_YEAR=$(date +%Y)
cat << EOF > PSL_strings.h
/*--------------------------------------------------------------------
 *      PSL_strings.h <auto-generated>
 *
 *      Copyright (c) 2009-$COPY_YEAR by the GMT Team (https://www.generic-mapping-tools.org/team.html)
 *
 *      This program is free software; you can redistribute it and/or modify
 *      it under the terms of the GNU Lesser General Public License as published by
 *      the Free Software Foundation; version 3 or any later version.
 *
 *      This program is distributed in the hope that it will be useful,
 *      but WITHOUT ANY WARRANTY; without even the implied warranty of
 *      MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *      GNU Lesser General Public License for more details.
 *
 *--------------------------------------------------------------------*/

/* The three former include files PSL_label.ps, PSL_text.ps, and PSL_prologue.ps
 * are now represented as three very long string literals instead.
 */
EOF
cat << EOF > /tmp/t.lis
PSL_label.ps
PSL_text.ps
PSL_prologue.ps
EOF
while read file; do
	printf "\n/* Placing content of $file */\n\n" >> PSL_strings.h
	n=`cat $file | wc -l`
	let n1=n-1
	varname=`basename $file .ps`
	sed -n 1,${n1}p $file | awk 'BEGIN {printf "static char *%s_str = \n", "'$varname'"}; {printf "\"%s\\n\"\n", $0}' >> PSL_strings.h
	sed -n ${n}p $file | awk '{printf "\"%s\\n\";\n", $0}'>> PSL_strings.h
done < /tmp/t.lis
rm -f /tmp/t.lis
