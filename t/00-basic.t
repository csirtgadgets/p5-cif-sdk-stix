use 5.011;
use strict;
use warnings;

use Test::More;
use Data::Dumper;


BEGIN {
    use_ok('CIF::SDK');
    use_ok('CIF::SDK::FormatFactory');
    use_ok('CIF::SDK::Stix');
};
my $ob = '10.0.0.1';

my $obs = {
    observable  => $ob,
    tlp         => 'red',
    lang        => 'en',
    tags        => 'botnet,zeus',
    confidence  => 65,
    group       => 'group1',
    additional_data => [
        {
            type    => 'string',
            meaning => 'meaning',
            content => 'test1234',
        },
    ],
    provider    => 'example.org',
    reporttime  => '2015-01-01T00:00:00Z',
};
my $formatter = CIF::SDK::FormatFactory->new_plugin({ 
    format      => 'stix', 
    description => 'cif watchlist' 
});

my $xml = $formatter->process($obs);

#diag($xml);

ok($xml =~ /stix.mitre.org/,'testing output...');

done_testing();
