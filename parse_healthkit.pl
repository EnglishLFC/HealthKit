#!/usr/bin/env perl
#
# File name: parse_healthkit.pl
# Date:      2017/09/13 13:34
# Author:    Nigel Houghton <wutang@warpten.net>
# $Id: $
#
#############################################################################
#

use strict;
use warnings;

#############################################################################
# Working with XML so...
use XML::Simple;
my $xml      = new XML::Simple;
#############################################################################
# First, we expect our data in a certain place
my $datafile = "apple_health_export/export.xml";
#############################################################################
# Now read it in
my $data     = $xml->XMLin($datafile);
print "Date,mg/dL" . "\n";
#############################################################################
# Now do something with it
foreach my $record (@{$data->{'Record'}}){
#############################################################################
# We only care about the blood glucose readings
  next unless $record->{'type'} eq "HKQuantityTypeIdentifierBloodGlucose";
#############################################################################
# We're printing it out as a CSV list
  print (join",",$record->{'creationDate'},$record->{'value'});
  print "\n";
};
#############################################################################
# We're done
exit();

__END__

=head1 parse_healthkit.pl

=head1 DESCRIPTION

=head1 USAGE

=head1 AUTHOR

  Nigel Houghton <nhoughto@cisco.com>

=head1 COPYRIGHT

  (c) Cisco Systems 2017

