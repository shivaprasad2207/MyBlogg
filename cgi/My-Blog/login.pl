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



use DBI;
use CGI;
use CGI qw(:all -utf8);
use warnings;
use CGI::Session;
use strict;
use Template;

my $LoginHeader = {
                        
                        -title => 'WEB My Blog',
                        -style=>[ 
                                       #{ -type =>'text/css', -src=>'/static/styles/My-Blog/lib_1.css'},
                                       { -type =>'text/css', -src=>'/static/styles/My-Blog/bootstrap.css'},
                                      
                                    ],  
                         -script=>[
                                        { -type => 'text/javascript', -src => '/static/js/My-Blog/jquery.js'},
                                        { -type => 'text/javascript', -src => '/static/js/My-Blog/jquery.min.js' },
                                        { -type => 'text/javascript', -src => '/static/js/My-Blog/pre_logout.js' },
                                        { -type => 'text/javascript', -src => '/static/js/My-Blog/bootstrap.js'},
                                     ],
                    };




my $cgi = new CGI;
$cgi->autoEscape(undef);
print $cgi->header(-type=>"text/html", -charset=>"UTF-8");

print $cgi->start_html($LoginHeader); 

if ($cgi->param('status') eq 'error'){
    print '<p style="background-color:red;border-radius: 10px; width:300px;" border="1">Authontication ..ERROR:</p>';
}
if ($cgi->param('status') eq 'logout'){
    
    print '<p style="background-color:yellow;border-radius: 10px; width:300px;" border="1">Logout Successfully</p>';
}
if ($cgi->param('status') eq 'Alogout'){
    print '<p style="background-color:pink;border-radius: 10px; width:300px;" border="1">You have Logout Previously</p>';
}
if ($cgi->param('status') eq 'jslogout'){
    my $sid = $cgi->param('sid');
    my $cookie = $cgi->cookie(
                            -name=>'CGISESSID',
                            -value=>$sid,
                            -expires=>'-1d',
                        );
     $cgi->redirect(-cookie=>$cookie,-location=>"login.pl?status=logout"); 
}

my $out;
     my $tt = Template->new;
     $tt->process('login.html', undef, \$out)
        || die $tt->error; 

print $out;


print '<div style="bottom:0px; float:right">
						<SMALL style="bottom:0px;float:inherit;color:#BC8F8F">
						      Web Site Copyright © Authored by Shivaprasad.Nanjundachari (nnsprasad@gmail.com)<br>
						      feedback on web site @ nnsprasad@gmail.com
						</SMALL>
          </div>'; 
   
print $cgi->end_html;