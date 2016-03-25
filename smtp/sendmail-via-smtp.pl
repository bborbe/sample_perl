#!/usr/bin/env perl

use strict;
use Net::SMTP;

my $smtp = Net::SMTP->new("iredmail.mailfolder.org",
  Hello => "www.benjamin-borbe.de",
  Timeout => 30,
  Debug   => 1,
);
$smtp->mail("bborbe\@rocketnews.de");
if ($smtp->to("bborbe\@rocketnews.de")) {
  $smtp->data();
  $smtp->datasend("Subject: TestMail\n");
  $smtp->datasend("To: bborbe\@rocketnews.de\n");
  $smtp->datasend("\n");
  $smtp->datasend("A simple test message\n");
  $smtp->dataend();
} else {
  print "Error: ", $smtp->message();
}
$smtp->quit;
