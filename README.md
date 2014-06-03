# CIF-STIX Software Development Kit for Perl

[![Build Status](https://travis-ci.org/csirtgadgets/p5-cif-sdk-stix.png?branch=master)](https://travis-ci.org/csirtgadgets/p5-cif-sdk-stix)

# Installation

To install this module type the following:
  ```bash
  perl Makefile.PL
  make
  make test
  make install
  ```
# Python Dependencies
This SDK requires some Python dependencies to interact with the Stix Python library using Perl's ``Inline::Python`` package.

  ```bash
  pip install python-stix libxml-dev libxslt1-dev cython
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

