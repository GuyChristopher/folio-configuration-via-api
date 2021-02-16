#!/usr/bin/perl

require 'getOkapiToken.pl';

use JSON;

@locinsts = `cat config-locinsts.txt`;
foreach $institution (@locinsts) {
	($name,$code) = split(/\|/,$institution);
	$json = qq[{"name":"$name","code":"$code"}]; 
	#print "$json\n\n";
	$postLocinsts = `curl -s -X POST -H '$jsonHeader' -H '$xOkapiToken' -d '$json' $baseURL/location-units/institutions`;
	$getLocinsts = `curl -s -X GET -H '$jsonHeader' -H '$xOkapiToken' $baseURL/location-units/institutions?query=code="$code"`;
	$hash = decode_json $getLocinsts;
	for ( @{$hash->{locinsts}} ) {
		$locinstsIds{$code} = $_->{'id'};
	}
}

@loccamps = `cat config-loccamps.txt`;
foreach $campus (@loccamps) {
	($name,$code,$locinstsCode) = split(/\|/,$campus);
	$institutionId = $locinstsIds{$locinstsCode};
	$json = qq[{"name":"$name","code":"$code","institutionId":"$institutionId"}]; 
	#print "$json\n\n";
	$postLoccamps = `curl -s -X POST -H '$jsonHeader' -H '$xOkapiToken' -d '$json' $baseURL/location-units/campuses`;
	$getLoccamps = `curl -s -X GET -H '$jsonHeader' -H '$xOkapiToken' $baseURL/location-units/campuses?query=code="$code"`;
	$hash = decode_json $getLoccamps;
	for ( @{$hash->{loccamps}} ) {
		$loccampsIds{$code} = $_->{'id'};
	}
}

@loclibs = `cat config-loclibs.txt`;
foreach $library (@loclibs) {
	($name,$code,$loccampsCode) = split(/\|/,$library);
	$campusId = $loccampsIds{$loccampsCode};
	$json = qq[{"name":"$name","code":"$code","campusId":"$campusId"}]; 
	#print "$json\n\n";
	$postLoclibs = `curl -s -X POST -H '$jsonHeader' -H '$xOkapiToken' -d '$json' $baseURL/location-units/libraries`;
	$getLoclibs = `curl -s -X GET -H '$jsonHeader' -H '$xOkapiToken' $baseURL/location-units/libraries?query=code="$code"`;
	$hash = decode_json $getLoclibs;
	for ( @{$hash->{loclibs}} ) {
		$loclibsIds{$code} = $_->{'id'};
	}
}

@servicepoints = `cat config-servicepoints.txt`;
foreach $servicepoint (@servicepoints) {
	($name,$code,$discoveryDisplayName) = split(/\|/,$servicepoint);
	$json = qq[{"name":"$name","code":"$code","discoveryDisplayName":"$discoveryDisplayName"}]; 
	#print "$json\n\n";
	$postServicepoints = `curl -s -X POST -H '$jsonHeader' -H '$xOkapiToken' -d '$json' $baseURL/service-points`;
	$getServicepoints = `curl -s -X GET -H '$jsonHeader' -H '$xOkapiToken' $baseURL/service-points?query=code="$code"`;
	$hash = decode_json $getServicepoints;
	for ( @{$hash->{servicepoints}} ) {
		$servicepointsIds{$code} = $_->{'id'};
	}
}

@locations = `cat config-locations.txt`;
foreach $location (@locations) {
	@locationInfo = split(/\|/,$location);
	$name = $locationInfo[0];
	$code = $locationInfo[1];
	$discoveryDisplayName = $locationInfo[2];
	$loclibsCode = $locationInfo[3]; $libraryId = $loclibsIds{$loclibsCode};
	$loccampsCode = $locationInfo[4]; $campusId = $loccampsIds{$loccampsCode};
	$locinstsCode = $locationInfo[5]; $institutionId = $locinstsIds{$locinstsCode};
	$primaryServicePointCode = $locationInfo[6]; $primaryServicePointId = $servicepointsIds{$primaryServicePointCode};
	$servicePointIds = "";
	for ($x = 7; $x < $#locationInfo; $x++) {
		if (length($locationInfo[$x]) > 0) {
			$servicePointIds = qq["] . $servicepointsIds{$locationInfo[$x]} . qq[",];
		}
	}
	chop($servicePointIds);
	$json = qq/{
	"name":"$name",
	"code":"$code",
	"isActive":true,
	"discoveryDisplayName":"$discoveryDisplayName",
	"institutionId":"$institutionId",
	"campusId":"$campusId",
	"libraryId":"$libraryId",
	"primaryServicePoint":"$primaryServicePointId",
	"servicePointIds":[$servicePointIds]
	}/; 
	#print "$json\n\n";
	$postLocations = `curl -s -X POST -H '$jsonHeader' -H '$xOkapiToken' -d '$json' $baseURL/locations`;
	print "$postLocations\n\n";
}
