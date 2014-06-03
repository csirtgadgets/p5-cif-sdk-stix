use inc::Module::Install;

name        'CIF-SDK-Stix';
all_from    'lib/CIF/SDK/Stix.pm';
license     'LGPL_3_0';
perl_version 5.011;

requires    'CIF::SDK';
requires    'Mouse'             => '2.3.0';
requires    'Inline::Python';

WriteAll;