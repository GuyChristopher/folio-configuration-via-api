#!/usr/bin/perl

$password = "[passwword]"; $username = "[username]";
$baseURL = "https://okapi-[institution].folio.ebsco.com";
$jsonHeader = "Content-type: application/json";
$xOkapiTenant = "[aa01234567]";

$post = `curl -i -s -w '\n' -X POST -H '$jsonHeader' -H 'X-Okapi-Tenant: $xOkapiTenant' -d '{"username": "$username", "password": "$password"}' $baseURL/authn/login`;
@parts = split(/\n/,$post); 
foreach $part (@parts) {
 if ($part =~ /^x-okapi-token:/) {
  $xOkapiToken = "X-Okapi-Token: " . substr($part,15);
 }
}

1;
