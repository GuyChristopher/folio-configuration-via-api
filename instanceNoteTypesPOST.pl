#!/usr/bin/perl

require 'getOkapiToken.pl'; use JSON;

@instanceNoteTypes = (
"General Note (500)",
"With Note (501)",
"Dissertation Note (502)",
"Bibliography, etc. Note (504)",
"Formatted Contents Note (505)",
"Restrictions on Access Note (506)",
"Scale Note for Graphic Material (507)",
"Creation/Production Credits Note (508)",
"Citation/References Note (510)",
"Participant or Performer Note (511)",
"Type of Report and Period Covered Note (513)",
"Data Quality Note (514)",
"Numbering Peculiarities Note (515)",
"Type of Computer File or Data Note (516)",
"Date/Time and Place of an Event Note (518)",
"Summary, etc. (520)",
"Target Audience Note (521)",
"Geographic Coverage Note (522)",
"Preferred Citation of Described Materials Note (524)",
"Supplement Note (525)",
"Study Program Information Note (526)",
"Additional Physical Form available Note (530)",
"Accessibility Note (532)",
"Reproduction Note (533)",
"Original Version Note (534)",
"Location of Originals/Duplicates Note (535)",
"Funding Information Note (536)",
"System Details Note (538)",
"Terms Governing Use and Reproduction Note (540)",
"Immediate Source of Acquisition Note (541)",
"Information Relating to Copyright Status (542)",
"Location of Other Archival Materials Note (544)",
"Biographical or Historical Data (545)",
"Language Note (546)",
"Former Title Complexity Note (547)",
"Issuing Body Note (550)",
"Entity and Attribute Information Note (552)",
"Cumulative Index/Finding Aids Note (555)",
"Information About Documentation Note (556)",
"Ownership and Custodial History (561)",
"Copy and Version Identification Note (562)",
"Binding Information (563)",
"Case File Characteristics Note (565)",
"Methodology Note (567)",
"Linking Entry Complexity Note (580)",
"Publications About Described Materials Note (581)",
"Action Note (583)",
"Accumulation and Frequency of Use Note (584)",
"Exhibitions Note (585)",
"Awards Note (586)",
"Source of Description, Etc. Note (588)",
"Local Notes (59X)"
);

foreach $name (@instanceNoteTypes) {
 $data = qq[
  {
   "name" : "$name",
   "source" : "local"
  }
 ];
 $json = `curl -s -w '\n' -X POST -H '$jsonHeader' -H '$xOkapiToken' -d '$data' $baseURL/instance-note-types`;
 print "$json \n";
}

