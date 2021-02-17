#!/usr/bin/perl

require '/opt/uks/getOkapiToken.pl';

use JSON;

$locinsts = `curl -s -w '\n' -X GET -G -H '$jsonHeader' -H '$xOkapiToken' -d 'limit=1000' $baseURL/location-units/institutions?query=id="*"`;
$hash = decode_json $locinsts;
open(w,">config-locinsts.txt");
for ( @{$hash->{locinsts}} ) {
	$code = $_->{'code'};
	$institutionId = $_->{'id'};
	$name = $_->{'name'};
	print w "$name|$code|\n";
	$locinstsCodes{$institutionId} = $code;
}
close(w);

$loccamps = `curl -s -w '\n' -X GET -G -H '$jsonHeader' -H '$xOkapiToken' -d 'limit=1000' $baseURL/location-units/campuses?query=id="*"`;
$hash = decode_json $loccamps;
open(w,">config-loccamps.txt");
for ( @{$hash->{loccamps}} ) {
	$campusId = $_->{'id'};
	$code = $_->{'code'};
	$institutionId = $_->{'institutionId'};
	$name = $_->{'name'};
	$locinstsCode = $locinstsCodes{$institutionId};
	print w "$name|$code|$locinstsCode|\n";
	$loccampsCodes{$campusId} = $code;
}
close(w);

$loclibs = `curl -s -w '\n' -X GET -G -H '$jsonHeader' -H '$xOkapiToken' -d 'limit=1000' $baseURL/location-units/libraries?query=id="*"`;
$hash = decode_json $loclibs;
open(w,">config-loclibs.txt");
for ( @{$hash->{loclibs}} ) {
	$campusId = $_->{'campusId'};
	$code = $_->{'code'};
	$libraryId = $_->{'id'};
	$name = $_->{'name'};
	$loccampsCode = $loccampsCodes{$campusId};
	print w "$name|$code|$loccampsCode|\n";
	$loclibsCodes{$libraryId} = $code;
}
close(w);

$servicepoints = `curl -s -w '\n' -X GET -G -H '$jsonHeader' -H '$xOkapiToken' -d 'limit=1000' $baseURL/service-points?query=id="*"`;
$hash = decode_json $servicepoints;
open(w,">config-servicepoints.txt");
for ( @{$hash->{servicepoints}} ) {
	$code = $_->{'code'};
	$discoveryDisplayName = $_->{'discoveryDisplayName'};
	$id = $_->{'id'};
	$name = $_->{'name'};
	print w "$name|$code|$discoveryDisplayName|\n";
	$servicepointsCodes{$id} = $code;
}
close(w);

$locations = `curl -s -w '\n' -X GET -G -H '$jsonHeader' -H '$xOkapiToken' -d 'limit=1000' $baseURL/locations?query=id="*"`;
$hash = decode_json $locations;
open(w,">config-locations.txt");
for ( @{$hash->{locations}} ) {
	$campusId = $_->{'campusId'};
	$code = $_->{'code'};
	$discoveryDisplayName = $_->{'discoveryDisplayName'};
	$institutionId = $_->{'institutionId'};
	$libraryId = $_->{'libraryId'};
	$loccampsCode = $loccampsCodes{$campusId};
	$locinstsCode = $locinstsCodes{$institutionId};
	$loclibsCode = $loclibsCodes{$libraryId};
	$name = $_->{'name'};
	$primaryServicePoint = $_->{'primaryServicePoint'};
	$primaryServicePointCode = $servicepointsCodes{$primaryServicePoint};
	$servicePointCodes = "";
        $servicePointIds = $_->{'servicePointIds'};
        for ( @{$servicePointIds} ) {
		$servicePointCodes .= $servicepointsCodes{$_} . "|";
	}
	$servicePointCodes =~ s/\|$//;
	print w "$name|$code|$discoveryDisplayName|$loclibsCode|$loccampsCode|$locinstsCode|$primaryServicePointCode|$servicePointCodes|\n";
}
close(w);
