#!/usr/bin/perl

require 'getOkapiToken.pl'; 

use JSON;

@alternativeTitleTypes = (
"Abbreviated key title",
"Abbreviated title",
"Added title page title",
"Caption title",
"Collective uniform title",
"Cover title",
"Distinctive title",
"Former title",
"Key title",
"No type specified",
"Other title",
"Parallel title",
"Portion of title",
"Running title",
"Spine title",
"Translation of title",
"Uncontrolled related/analytical title",
"Uniform title"
);

foreach $name (@alternativeTitleTypes) {
 $jsonIn = qq[{"name":"$name","source":"local"}];
 $jsonOut = `curl -s -w '\n' -X POST -H '$jsonHeader' -H '$xOkapiToken' -d '$jsonIn' $baseURL/alternative-title-types`;
 print "$jsonIn \n\n$jsonOut \n\n";
}
