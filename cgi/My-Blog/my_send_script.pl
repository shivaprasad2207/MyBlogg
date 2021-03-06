#!/usr/bin/perl
BEGIN {
   push @INC, "./lib";  
   push @INC, '/home/nnsprasad/perl/usr/lib/perl5';
   push @INC, '/home/nnsprasad/perl/usr/lib/perl5/x86_64-linux-thread-multi';
   require '/home/nnsprasad/public_html/cgi-bin/My-Blog/debug.pl';
   binmode(STDIN );  # Form data
   binmode(STDOUT, ':encoding(UTF-8)');  # HTML
   binmode(STDERR, ':encoding(UTF-8)');  # Error messages
}

use warnings;
use strict;
use CGI;
use CGI::Carp qw(fatalsToBrowser);
use POSIX qw/strftime/;
use MIME::Lite;
use MIME::Parser;
use Net::SMTP::SSL;
use MIME::Base64;
use Net::SMTP::SSL;
use MIME::Base64;

my $from = 'my.blogger.respoce@gmail.com';
my $password = 'googlerichi';

my $to = $ARGV[0];
my $subject = "Subject: " . $ARGV[1] ;
my $data = $ARGV[2];
my $html_data = $ARGV[3];
my $smtp;

if (not $smtp = Net::SMTP::SSL->new(
                                    'smtp.gmail.com',
                                     Port => 465,
                              )) {
     die "Could not connect to server\n";
}

# Authenticate
 $smtp->auth($from, $password)
     || die "Authentication failed!\n";

$smtp->mail($from . "\n");
$smtp->to($to . "\n");

$smtp->data();
$smtp->datasend("From: " . $from . '\n' ."To: " . $to . "\n" .
                $subject ."Content-Type: text/plain\n" .
                $data . '\n' . "Content-Type: text/html\n" . $html_data
              );

$smtp->dataend();

undef $smtp;
#$smtp->quit;

exit (0);