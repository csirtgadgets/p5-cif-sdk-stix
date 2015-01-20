package CIF::SDK::Format::Stix;

use Inline Python; # this needs to be before strict/warnings

use strict;
use warnings;

use Mouse;

with 'CIF::SDK::Format';

=head1 NAME

CIF::SDK::Format::Stix - Perl extension for writing out STIX data

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

A simple translation between key-pairs and STIX.

=cut

=head2 Attributes

=over

=item description

=cut

has 'description' => (
    is      => 'ro',
    isa     => 'Str',
    reader  => 'get_description',
);

=back

=cut

sub understands {
    my $self = shift;
    my $args = shift;

    return unless($args->{'format'});
    return 1 if($args->{'format'} eq 'stix');
}

=head2 Methods

=over

=item process

=cut

sub process {
    my $self = shift;
    my $data = shift;
    
    $data = [ $data ] unless(ref($data) eq 'ARRAY');
    
   
    
    my $stix = _create_stix($self->get_description());
     
    foreach (@$data){
        my $i = _create_indicator({%$_}); # convert to a plain hash for python
        $stix->add_indicator($i);
    }
    return $stix->to_xml();
}

=back

=cut

__PACKAGE__->meta()->make_immutable();

1;
__DATA__
__Python__
import time
from stix.indicator import Indicator
from stix.core import STIXPackage, STIXHeader
from cybox.common import Hash
from cybox.objects.file_object import File
from cybox.objects.address_object import Address
from dateutil.parser import parse

import pprint
pp = pprint.PrettyPrinter(indent=4)
import re
import sys

def _create_stix(description):
    stix_package = STIXPackage()
    
    stix_header = STIXHeader()
    stix_header.description = description
    stix_package.stix_header = stix_header
        
    return stix_package;
    
def _create_indicator(keypair):
    indicator = Indicator()
    
    indicator.set_producer_identity(keypair.get('provider'))
    
    indicator.set_produced_time(keypair.get('reporttime'))
    
    indicator.description = ','.join(keypair.get('tags'))
    
    otype = keypair.get('otype')

    if otype == 'md5':
        f = _md5(keypair)
    elif otype == 'sha1':
        f = _sha1(keypair)
    elif otype == 'sha256':
        f = _sha256(keypair)
    else:
        f = _address(keypair)
        
    indicator.add_object(f)
    
    return indicator
    
def _md5(keypair):
    shv = Hash()
    shv.simple_hash_value = keypair.get('observable')
    
    f = File()
    h = Hash(shv, Hash.TYPE_MD5)
    f.add_hash(h)
    return f
    
def _sha1(keypair):
    shv = Hash()
    shv.simple_hash_value = keypair.get('observable')
    
    f = File()
    h = Hash(shv, Hash.TYPE_SHA1)
    f.add_hash(h)
    return f

def _sha256(keypair):
    shv = Hash()
    shv.simple_hash_value = keypair.get('observable')
    
    f = File()
    h = Hash(shv, Hash.TYPE_SHA256)
    f.add_hash(h)
    return f

def _address(keypair):
    address = keypair.get('observable')
    if _address_fqdn(address):
        return Address(address,'fqdn')
    elif _address_ipv4(address):
        return Address(address,'ipv4-addr')
    elif _address_url(address):
        return Address(address,'url')

def _address_ipv4(address):
    if re.search('^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}',address):
        return 1  

def _address_fqdn(address):
    if re.search('^[a-zA-Z0-9.\-_]+\.[a-z]{2,6}$',address):
        return 1

def _address_url(address):
    if re.search('^(ftp|https?):\/\/',address):
        return 1
