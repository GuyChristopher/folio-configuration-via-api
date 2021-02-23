#!/usr/bin/perl

require 'getOkapiToken.pl'; 

use JSON;

@contributorNameTypes = (
"Personal Name|1",
"Corporate Name|2",
"Meeting Name|3"
);

foreach $row (@contributorNameTypes) {
 ($name,$number) = split(/\|/,$row);
 $data = qq[
  {
   "name" : "$name",
   "ordering" : "$number"
  }
 ];
 $json = `curl -s -w '\n' -X POST -H '$jsonHeader' -H '$xOkapiToken' -d '$data' $baseURL/contributor-name-types`;
 print "$json\n";
}
