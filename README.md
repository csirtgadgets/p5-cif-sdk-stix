# CIF-STIX Software Development Kit for Perl

[![Build Status](https://travis-ci.org/csirtgadgets/p5-cif-sdk-stix.png?branch=master)](https://travis-ci.org/csirtgadgets/p5-cif-sdk-stix)

# Installation
## Ubuntu
 1. Install the [p5-cif-sdk](https://github.com/csirtgadgets/p5-cif-sdk) first.
 1. Then type the following:
 ```
 sudo apt-get install -y libxml-dev libxslt1-dev cython python-dev python-pip
 pip install stix
 git clone https://github.com/csirtgadgets/p5-cif-sdk-stix.git -b master
 cd p5-cif-sdk-stix
 perl Makefile.PL
 cpanm --installdeps .
 make
 make test
 make install
 ```

# Support and Documentation

After installing, you can find documentation for this module with the
perldoc command.

    perldoc CIF::SDK::Stix

You can also look for information at the [GitHub repo](https://github.com/csirtgadgets/p5-cif-sdk-stix).

# SEE ALSO

 * [python-stix](https://github.com/STIXProject/python-stix)
 * [cif_json2stix](https://github.com/akreffett/cif_json2stix)

# License and Copyright

Copyright (C) 2014 [the CSIRT Gadgets Foundation](http://csirtgadgets.org)

Free use of this software is granted under the terms of the [GNU Lesser General Public License](https://www.gnu.org/licenses/lgpl.html) (LGPL v3.0). For details see the file ``LICENSE`` included with the distribution.

