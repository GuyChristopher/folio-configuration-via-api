#!/usr/bin/perl

require 'getOkapiToken.pl'; use JSON;

$alternativeTitleTypes = "<li>alternativeTitleTypes (Alternative title types) id name source<ol>";
$json = `curl -s -w '\n' -X GET -G -H '$jsonHeader' -H '$xOkapiToken' -d 'limit=1000' $baseURL/alternative-title-types?query=id="*"`;
$hash = decode_json $json;
for ( @{$hash->{alternativeTitleTypes}} ) {
 $id = $_->{'id'};
 $name = $_->{'name'};
 $source = $_->{'source'};
 $alternativeTitleTypes .= "<li>$id $name $source";
}
$alternativeTitleTypes .= "</ol>";

$electronicAccessRelationships = "<li>electronicAccessRelationships (URL relationship) id name<ol>";
$json = `curl -s -w '\n' -X GET -G -H '$jsonHeader' -H '$xOkapiToken' -d 'limit=1000' $baseURL/electronic-access-relationships?query=id="*"`;
$hash = decode_json $json;
for ( @{$hash->{electronicAccessRelationships}} ) {
 $id = $_->{'id'};
 $name = $_->{'name'};
 $electronicAccessRelationships .= "<li>$id $name";
}
$electronicAccessRelationships .= "</ol>";

$callNumberTypes = "<li>callNumberTypes (Call number types) id name source<ol>";
$json = `curl -s -w '\n' -X GET -G -H '$jsonHeader' -H '$xOkapiToken' -d 'limit=1000' $baseURL/call-number-types?query=id="*"`;
$hash = decode_json $json;
for ( @{$hash->{callNumberTypes}} ) {
 $id = $_->{'id'};
 $name = $_->{'name'};
 $source = $_->{'source'};
 $callNumberTypes .= "<li>$id $name $source";
}
$callNumberTypes .= "</ol>";

$contributorNameTypes = qq[<li>contributorNameTypes (<font color="red">not in the UI</font>) id code name source<ol>];
$json = `curl -s -w '\n' -X GET -G -H '$jsonHeader' -H '$xOkapiToken' -d 'limit=1000' $baseURL/contributor-name-types?query=id="*"`;
$hash = decode_json $json;
for ( @{$hash->{contributorNameTypes}} ) {
 $code = $_->{'code'};
 $id = $_->{'id'};
 $name = $_->{'name'};
 $source = $_->{'source'};
 $contributorNameTypes .= "<li>$id $code $name $source";
}
$contributorNameTypes .= "</ol>";

$contributorTypes = "<li>contributorTypes (Contributor types) id code name source<ol>";
$json = `curl -s -w '\n' -X GET -G -H '$jsonHeader' -H '$xOkapiToken' -d 'limit=1000' $baseURL/contributor-types?query=id="*"`;
$hash = decode_json $json;
for ( @{$hash->{contributorTypes}} ) {
 $code = $_->{'code'};
 $id = $_->{'id'};
 $name = $_->{'name'};
 $source = $_->{'source'};
 $contributorTypes .= "<li>$id $code $name $source";
}
$contributorTypes .= "</ol>";

$holdingsNoteTypes = "<li>holdingsNoteTypes (Holdings note types) id name source<ol>";
$json = `curl -s -w '\n' -X GET -G -H '$jsonHeader' -H '$xOkapiToken' -d 'limit=1000' $baseURL/holdings-note-types?query=id="*"`;
$hash = decode_json $json;
for ( @{$hash->{holdingsNoteTypes}} ) {
 $id = $_->{'id'};
 $name = $_->{'name'};
 $source = $_->{'source'};
 $holdingsNoteTypes .= "<li>$id $name $source";
}
$holdingsNoteTypes .= "</ol>";

$identifierTypes = "<li>identifierTypes (Resource identifier types) id name source<ol>";
$json = `curl -s -w '\n' -X GET -G -H '$jsonHeader' -H '$xOkapiToken' -d 'limit=1000' $baseURL/identifier-types?query=id="*"`;
$hash = decode_json $json;
for ( @{$hash->{identifierTypes}} ) {
 $id = $_->{'id'};
 $name = $_->{'name'};
 $source = $_->{'source'};
 $identifierTypes .= "<li>$id $name $source";
}
$identifierTypes .= "</ol>";

$instanceFormats = "<li>instanceFormats (Formats) id code name source<ol>";
$json = `curl -s -w '\n' -X GET -G -H '$jsonHeader' -H '$xOkapiToken' -d 'limit=1000' $baseURL/instance-formats?query=id="*"`;
$hash = decode_json $json;
for ( @{$hash->{instanceFormats}} ) {
 $code = $_->{'code'};
 $id = $_->{'id'};
 $name = $_->{'name'};
 $source = $_->{'source'};
 $instanceFormats .= "<li>$id $code $name $source";
}
$instanceFormats .= "</ol>";

$instanceNoteTypes = "<li>instanceNoteTypes (Instance note types) id name source<ol>";
$json = `curl -s -w '\n' -X GET -G -H '$jsonHeader' -H '$xOkapiToken' -d 'limit=1000' $baseURL/instance-note-types?query=id="*"`;
$hash = decode_json $json;
for ( @{$hash->{instanceNoteTypes}} ) {
 $id = $_->{'id'};
 $name = $_->{'name'};
 $source = $_->{'source'};
 $instanceNoteTypes .= "<li>$id $name $source";
}
$instanceNoteTypes .= "</ol>";

$instanceStatuses = "<li>instanceStatuses (Instance status types) id code name source<ol>";
$json = `curl -s -w '\n' -X GET -G -H '$jsonHeader' -H '$xOkapiToken' -d 'limit=1000' $baseURL/instance-statuses?query=id="*"`;
$hash = decode_json $json;
for ( @{$hash->{instanceStatuses}} ) {
 $code = $_->{'code'};
 $id = $_->{'id'};
 $name = $_->{'name'};
 $source = $_->{'source'};
 $instanceStatuses .= "<li>$id $code $name $source";
}
$instanceStatuses .= "</ol>";

$instanceTypes = "<li>instanceTypes (Resource types) id code name source<ol>";
$json = `curl -s -w '\n' -X GET -G -H '$jsonHeader' -H '$xOkapiToken' -d 'limit=1000' $baseURL/instance-types?query=id="*"`;
$hash = decode_json $json;
for ( @{$hash->{instanceTypes}} ) {
 $code = $_->{'code'};
 $id = $_->{'id'};
 $name = $_->{'name'};
 $source = $_->{'source'};
 $instanceTypes .= "<li>$id $code $name $source";
}
$instanceTypes .= "</ol>";

$issuanceModes = "<li>issuanceModes (Mode of issuance) id name source<ol>";
$json = `curl -s -w '\n' -X GET -G -H '$jsonHeader' -H '$xOkapiToken' -d 'limit=1000' $baseURL/modes-of-issuance?query=id="*"`;
$hash = decode_json $json;
for ( @{$hash->{issuanceModes}} ) {
 $id = $_->{'id'};
 $name = $_->{'name'};
 $source = $_->{'source'};
 $issuanceModes .= "<li>$id $name $source";
}
$issuanceModes .= "</ol>";

$itemNoteTypes = "<li>itemNoteTypes (Item note types) id name source<ol>";
$json = `curl -s -w '\n' -X GET -G -H '$jsonHeader' -H '$xOkapiToken' -d 'limit=1000' $baseURL/item-note-types?query=id="*"`;
$hash = decode_json $json;
for ( @{$hash->{itemNoteTypes}} ) {
 $id = $_->{'id'};
 $name = $_->{'name'};
 $source = $_->{'source'};
 $itemNoteTypes .= "<li>$id $name $source";
}
$itemNoteTypes .= "</ol>";

$loantypes = "<li>loantypes (Loan types) id name<ol>";
$json = `curl -s -w '\n' -X GET -G -H '$jsonHeader' -H '$xOkapiToken' -d 'limit=1000' $baseURL/loan-types?query=id="*"`;
$hash = decode_json $json;
for ( @{$hash->{loantypes}} ) {
 $id = $_->{'id'};
 $name = $_->{'name'};
 $loantypes .= "<li>$id $name";
}
$loantypes .= "</ol>";

$locations = "<li>locinsts, loccamps, loclibs, & locations (Institutions (Campuses (Libraries (Locations))))<ul>";
$json = `curl -s -w '\n' -X GET -G -H '$jsonHeader' -H '$xOkapiToken' -d 'limit=1000' $baseURL/location-units/institutions?query=id="*"`;
$hash = decode_json $json;
for ( @{$hash->{locinsts}} ) {
 $code = $_->{'code'};
 $id = $_->{'id'};
 $institution = $_->{'name'};
 $locations .= "<li>$institution ($code)<ul>";
 $json = `curl -s -w '\n' -X GET -G -H '$jsonHeader' -H '$xOkapiToken' -d 'limit=1000' $baseURL/location-units/campuses?query=institutionId="$id"`;
 $hash = decode_json $json;
 for ( @{$hash->{loccamps}} ) {
  $code = $_->{'code'};
  $id = $_->{'id'};
  $campus = $_->{'name'};
  $locations .= "<li>$campus ($code)<ul>";
  $json = `curl -s -w '\n' -X GET -G -H '$jsonHeader' -H '$xOkapiToken' -d 'limit=1000' $baseURL/location-units/libraries?query=campusId="$id"`;
  $hash = decode_json $json;
  for ( @{$hash->{loclibs}} ) {
   $code = $_->{'code'};
   $id = $_->{'id'};
   $library = $_->{'name'};
   $locations .= "<li>$library ($code)<ul>";
   $json = `curl -s -w '\n' -X GET -G -H '$jsonHeader' -H '$xOkapiToken' -d 'limit=1000' $baseURL/locations?query=libraryId="$id"`;
   $hash = decode_json $json;
   for ( @{$hash->{locations}} ) {
    $code = $_->{'code'};
    $id = $_->{'id'};
    $location = $_->{'name'};
    $locations .= "<li>$location ($code)";
   }
   $locations .= "</ul>";
  }
  $locations .= "</ul>";
 }
 $locations .= "</ul>";
}
$locations .= "</ul>";

$mtypes = "<li>mtypes (Material types) id name source<ol>";
$json = `curl -s -w '\n' -X GET -G -H '$jsonHeader' -H '$xOkapiToken' -d 'limit=1000' $baseURL/material-types?query=id="*"`;
$hash = decode_json $json;
for ( @{$hash->{mtypes}} ) {
 $id = $_->{'id'};
 $name = $_->{'name'};
 $source = $_->{'source'};
 $mtypes .= "<li>$id $name $source";
}
$mtypes .= "</ol>";

$natureOfContentTerms = "<li>natureOfContentTerms (Nature of content) id name source<ol>";
$json = `curl -s -w '\n' -X GET -G -H '$jsonHeader' -H '$xOkapiToken' -d 'limit=1000' $baseURL/nature-of-content-terms?query=id="*"`;
$hash = decode_json $json;
for ( @{$hash->{natureOfContentTerms}} ) {
 $id = $_->{'id'};
 $name = $_->{'name'};
 $source = $_->{'source'};
 $natureOfContentTerms .= "<li>$id $name $source";
}
$natureOfContentTerms .= "</ol>";

$servicepoints = "<li>servicepoints (Service points) id code discoveryDisplayName name<ol>";
$json = `curl -s -w '\n' -X GET -G -H '$jsonHeader' -H '$xOkapiToken' -d 'limit=1000' $baseURL/service-points?query=id="*"`;
$hash = decode_json $json;
for ( @{$hash->{servicepoints}} ) {
 $code = $_->{'code'};
 $id = $_->{'id'};
 $discoveryDisplayName = $_->{'discoveryDisplayName'};
 $name = $_->{'name'};
 $servicepoints .= "<li>$id $code $discoverDisplayName $name";
}
$servicepoints .= "</ol>";

$html = qq[
 these db tables must be populated before instances, holdingsRecords, and items can be POSTed
 <p><ul>
 <p>$instanceTypes
 <p>$loantypes
 <p>$locations
 <p>$mtypes
 <p>$servicepoints
 </ul>
 these db tables may not be musts but they are def helpful
 <p><ul>
 <p>$alternativeTitleTypes
 <p>$callNumberTypes
 <p>$contributorNameTypes
 <p>$contributorTypes
 <p>$electronicAccessRelationships
 <p>$holdingsNoteTypes
 <p>$identifierTypes
 <p>$instanceFormats
 <p>$instanceNoteTypes
 <p>$instanceStatuses
 <p>$issuanceModes
 <p>$itemNoteTypes
 <p>$natureOfContentTerms
 </ul>
];

print qq[Content-type: text/html\n\n

 <HTML>
 <HEAD>
  <TITLE>getConfig</TITLE>
  <STYLE TYPE="text/css">
   .v {font-size: 12px; font-family: Verdana, Arial, Helvetica, sans-serif;color:#062AAF;}
  </STYLE>
 </HEAD>
 <BODY class="v"> $html </BODY>
 </HTML> 

];
