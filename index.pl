#!/usr/bin/env perl
use Dancer2;
use Plack::Runner;



set apphandler => 'PSGI';
set environment => 'production';

my $psgi;
$psgi = path($ENV{'DOCUMENT_ROOT'}, 'bin', 'app.psgi');
die "Unable to read startup script: $psgi" unless -r $psgi;

Plack::Runner->run($psgi);
