#!/bin/bash
#
#	$Id: rendering.sh,v 1.4 2011-03-15 02:06:45 guru Exp $

. ../functions.sh
header "Test grdimage for rendering issues"

ps=rendering.ps

xyz2grd -R0/360/0/90 -r -I60/30 -Gt.nc <<%
#30 45 -1
90 15 -1
30 75 0
90 45 0
150 15 0
90 75 1
150 45 1
210 15 1
150 75 0
210 45 0
270 15 0
210 75 -1
270 45 -1
330 15 -1
270 75 0
330 45 0
#
30 15 0
330 75 -1
%

render () {
grdimage $GMT_VERBOSE -R -JW0/6i -B60/30 t.nc -Ct.cpt -E100 -O -K $*
pstext -R -J -F+f16p,Helvetica-Bold+jBL -O -K -N <<< "180 35 $1"
}

makecpt -Cpolar -T-1/1/0.5 -Z -D > t.cpt

psscale -D3i/-0.4i/6i/0.4ih -Ct.cpt -P -K -Y2i > $ps
render -Sn >> $ps
render -Sl -Y2i >> $ps
render -Sb -Y2i >> $ps
render -Sc -Y2i >> $ps
psxy -R -J /dev/null -O >> $ps

rm -f t.nc t.cpt

pscmp
