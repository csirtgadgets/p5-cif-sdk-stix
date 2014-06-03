use 5.011;
use strict;
use warnings;

use Test::More;
use Data::Dumper;

BEGIN {
    use_ok('CIFx::Format::Stix');
    use_ok('CIF::ObservableFactory');
    use_ok('CIF::FormatFactory');
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
    reporttime  => (time() - 84600),
};

my $msg = CIF::ObservableFactory->new_plugin($obs);

my $formatter = CIF::FormatFactory->new_plugin({ 
    format      => 'stix', 
    description => 'cif watchlist' 
});

my $xml = $formatter->process($msg);

ok($xml =~ /stix.mitre.org/,'testing output...');

done_testing();