use inc::Module::Install;

name        'CIF-SDK-Stix';
perl_version 5.011;
all_from    'lib/CIF/SDK/Stix.pm';
license     'LGPL_3_0';

requires    'CIF::SDK';
requires    'Mouse'             => '2.2.0';
requires    'Inline'            => '0.53'; # 0.54+ are broken atm, https://rt.cpan.org/Public/Bug/Display.html?id=65703
requires    'Inline::Python';

WriteAll;
