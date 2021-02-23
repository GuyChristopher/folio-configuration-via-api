#!/usr/bin/perl

require 'getOkapiToken.pl'; 

use JSON;

@rda = (
"cartographic dataset|crd",
"cartographic image|cri",
"cartographic moving image|crm",
"cartographic tactile image|crt",
"cartographic tactile three-dimensional form|crn",
"cartographic three-dimensional form|crf",
"computer dataset|cod",
"computer program|cop",
"notated movement|ntv",
"notated music|ntm",
"performed music|prm",
"sounds|snd",
"spoken word|spw",
"still image|sti",
"tactile image|tci",
"tactile notated music|tcm",
"tactile notated movement|tcn",
"tactile text|tct",
"tactile three-dimensional form|tcf",
"text|txt",
"three-dimensional form|tdf",
"three-dimensional moving image|tdm",
"two-dimensional moving image|tdi",
"other|xxx",
"unspecified|zzz"
);

foreach $pair (@rda) {
 ($name,$code) = split(/\|/,$pair);
 $jsonIn = qq[{"name":"$name","code":"$code","source":"rdacontent"}];
 $jsonOut = `curl -s -w '\n' -X POST -H '$jsonHeader' -H '$xOkapiToken' -d '$jsonIn' $baseURL/instance-types`;
}

$json = `curl -s -w '\n' -X GET -G -H '$jsonHeader' -H '$xOkapiToken' -d 'limit=100' $baseURL/instance-types?query=id="*"`;
$hash = decode_json $json;
for ( @{$hash->{instanceTypes}} ) {
 $code   = $_->{'code'};
 $id     = $_->{'id'};
 $name   = $_->{'name'};
 $source = $_->{'source'};
 print "$id $source $code $name \n";
}

