.. index:: ! psevents
.. include:: module_core_purpose.rst_

********
psevents
********

|psevents_purpose|

Synopsis
--------

.. include:: common_SYN_OPTs.rst_

**gmt psevents** [ *table* ] |-J|\ *parameters* |SYN_OPT-Rz| |-S|\ *symbol*\ [*size*\ [*units*]]
[ |-A|\ *magnify*\ [**+c**\ *magnify2*] ]
[ |SYN_OPT-B| ]
[ |-C|\ *cpt* ]
[ |-D|\ [**j**\ \|\ **J**]\ *dx*\ [/*dy*][\ **+v**\ [*pen*]] ]
[ |-E|\ **s**\ \|\ **t**\ [**+o**\ \|\ **O**\ *dt*][**+r**\ *dt*][**+p**\ *dt*][**+d**\ *dt*][**+f**\ *dt*] ]
[ |-F|\ [**+a**\ *angle*][\ **+f**\ *font*][\ **+j**\ *justify*][\ **+r**\ [*first*]\ \|\ **+z**\ [*format*]] ] 
[ |-G|\ *color* ]
[ |-K| ]
[ |-L|\ [*length*\ \|\ **t**\ ] ]
[ |-M|\ **i**\ \|\ **s**\ \|\ **t**\ [*val1*]\ [**+c**\ *val2*] ]
[ |-O| ] [ **-P** ]
[ |-Q|\ *prefix* ]
[ |SYN_OPT-V| ]
[ |-W|\ *pen* ]
[ |SYN_OPT-U| ]
[ |-W|\ *pen* ]
[ |SYN_OPT-X| ]
[ |SYN_OPT-Y| ]
[ |SYN_OPT-bi| ]
[ |SYN_OPT-di| ]
[ |SYN_OPT-e| ]
[ |SYN_OPT-f| ]
[ |SYN_OPT-h| ]
[ |SYN_OPT-i| ]
[ |SYN_OPT-p| ]
[ |SYN_OPT-:| ]
[ |SYN_OPT--| ]

.. include:: events_common.rst_

.. include:: common_classic.rst_

Examples
--------

.. include:: explain_example.rst_

To show the display of events visible for May 1, 2018 given the catalog of
large (>5) magnitude earthquakes that year, using a 2-day rise time during
which we boost symbol size by a factor of 5 and wash out the color, followed
by a decay over 6 days and then a final shrinking to half size and darken the
color, we may try

   ::

    gmt convert "https://earthquake.usgs.gov/fdsnws/event/1/query.csv?starttime=2018-01-01%2000:00:00&endtime=2018-12-31%2000:00:00&minmagnitude=5&orderby=time-asc" \
        -i2,1,3,4+s50,0 -hi1 > q.txt
    gmt makecpt -Cred,green,blue -T0,70,300,10000 > q.cpt
    gmt psevents -Rg -JG200/5/6i -Baf q.txt -SE- -Cq.cpt --TIME_UNIT=d -T2018-05-01T -Es+r2+d6 -Ms5+c0.5 -Mi1+c-0.6 -Mt+c0 -P > tlayer.ps

See Also
--------

:doc:`gmt`, :doc:`gmtcolors`,
:doc:`psxy`
