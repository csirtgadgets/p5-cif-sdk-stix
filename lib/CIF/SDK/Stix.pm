package CIF::SDK::Stix;

use strict;
use warnings;

our $VERSION = '0.00_01';
$VERSION = eval $VERSION;  # see L<perlmodstyle>

=head1 NAME

CIF::SDK::Stix - Perl extension for integrating Stix with CIF

=head1 SYNOPSIS

  use feature 'say';
  use CIF::SDK::FormatFactory;
  my $obs = {
      observable  => 'example.com',
      tlp         => 'red',
      tags        => 'botnet,zeus',
      confidence  => 65,
      group       => 'group1',
      provider    => 'example.org',
      reporttime  => (time() - 84600),
  };

  my $formatter = CIF::SDK::FormatFactory->new_plugin({ 
      format      => 'stix', 
      description => 'cif watchlist' 
  });

  my $xml = $formatter->process($obs);
  
  say $xml;

=head1 DESCRIPTION

A CIF SDK extension for manipuating STIX data.

=head1 BUGS AND SUPPORT

Please report any bugs at L<http://github.com/csirtgadgets/p5-cif-sdk-stix/issues>.

=head1 AUTHOR

  Wes Young <wes@barely3am.com>

=head1 COPYRIGHT AND LICENSE

Copyright (c) 2014 the CSIRT Gadgets Foundation

This program is free software; you can redistribute it and/or modify it
under the terms of the the LGPL (v3). 

=cut

1;
