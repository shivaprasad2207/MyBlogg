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

use CGI;
require 'debug.pl';
use CGI qw(:all -utf8);
use CGI::Carp qw(fatalsToBrowser);
require CGI::Session;
use Template;
use lib::Headers;
use strict;
use warnings;
use Myvars;
use Data::Dumper;
our $MainPageHeader;

our $H1;
our $H12;
our $H2;
our $H3;
our $H4;
our $H5;
our $H6;
my $cgi = CGI::new;


my %page_function_hash = (
   
        'Health' => {
                        pFunction => \&F_Health,
                        pHeader =>  $MainPageHeader,
                        pBody => 'F_MainPageBody',
                        pFooter => 'F_MainPageFooter',
                        
                     },
        'MPID' => {
                        pFunction => \&F_MPID,
                        pHeader =>  $MainPageHeader,
                        pBody => 'F_MainPageBody',
                        pFooter => 'F_MainPageFooter',
                        
                     },
        'ShowQlist' => {
                        pFunction => \&F_ShowQlist,
                        pHeader =>  $MainPageHeader,
                        pBody => 'F_MainPageBody',
                        pFooter => 'F_MainPageFooter',
                        
                     },
        'ShowThread' =>  {
                        pFunction => \&F_ShowThread,
                        pHeader =>  $MainPageHeader,
                        pBody => 'F_MainPageBody',
                        pFooter => 'F_MainPageFooter',
                        
                     },
        'Settings' =>  {
                        pFunction => \&F_Settings,
                        pHeader =>  $MainPageHeader,
                        pBody => 'F_MainPageBody',
                        pFooter => 'F_MainPageFooter',
                        
                     },
         'RESPOND_COMNT' =>  {
                        pFunction => \&F_RESPOND_COMNT,
                        pHeader =>  $MainPageHeader,
                        pBody => 'F_MainPageBody',
                        pFooter => 'F_MainPageFooter',
                        
                     },
         'NEW_USER' => {
                        pFunction => \&F_NEW_USER,
                        pHeader =>  $MainPageHeader,
                        pBody =>  'F_MainPageBody',
                        pFooter => 'F_MainPageFooter',
                        
                     },
  
);



&AppInit( $cgi ); 

sub AppInit {
    my ($cgi) = @_;
    my $param = $cgi->param('AppParam');
    if (!$param){
        $param = 'MainPage';
    }elsif ($param =~ /\?/){
        my @params = split '\?' , $param;
        $cgi->{code} = $params[1];
        $param = $params[0];
    }
    $cgi->{'AppParam'} = $param  ;
    my $function_ref = $page_function_hash{$param}->{'pFunction'};
    $function_ref->($cgi);
}


sub F_MPID {
    my ($cgi) = @_;
    my ($user_name,$role) = is_valid_user($cgi);
    my $param = $cgi->{'AppParam'};
    my $mpid = $cgi->param('mpid');
    my $PageHeader = $page_function_hash{$param}->{'pHeader'};
    my $sid = $cgi->cookie('CGISESSID');
    my $session = CGI::Session->new( $sid );
    my $name = $session->param("usr_name"); 
    my $uid = get_user_id_by_name_from_db ( $name);
   
    print $cgi->header( );
    print $cgi->start_html($PageHeader);
     $H12 =~ s/%NAME%/$user_name/;
     $H12 =~ s/SID/$sid/;
     $H12 =~ s/%MPID%/$mpid/;
    print $H12;
    my $out1;
   
   my @SoftWare = get_all_subpage_info_by_mpid( $mpid, $uid );
   my $elements = @SoftWare;
   my $loop = $elements/6;
   my $remainder = $elements % 6;
   if ( $remainder ){
      $loop++ ;
   }
   my ($from, $to)  = ( 0, 5);
   foreach my $i (0 .. $loop - 1){
      my @h1 = @SoftWare[$from..$to];
      my $data = {
         info => \@h1 
      };
   my $tt = Template->new;
        $tt->process('secondery_page.html', $data ,\$out1)
        || die $tt->error;
   print $out1;
   undef $out1;
   $from = $from + 6;
   $to = $to + 6 ;
 }  
 print $cgi->end_html();
}


sub F_Settings{
    my $param = $cgi->{'AppParam'};
    my $sid = $cgi->cookie('CGISESSID');
    my $session = CGI::Session->new( $sid );
    my $name = $session->param("usr_name"); 
    my $uid = get_user_id_by_name_from_db ( $name);
    my $PageHeader = $page_function_hash{$param}->{'pHeader'};
    print $cgi->header( );
    print $cgi->start_html($PageHeader);
    $H5 =~ s/%NAME%/$name/;
    $H5 =~ s/%uid%/$uid/g;
    print $H5;
   print $cgi->end_html(); 
   
}


sub F_ShowQlist {
    my ($cgi) = @_;
    my $param = $cgi->{'AppParam'};
    my $spid = $cgi->param('spid');
    my $mpid = $cgi->param('mpid');
    my $sub_topic = get_sub_topic_name ( $mpid, $spid );
    my $main_topic = get_main_topic_name_by_mpid ( $mpid);
    my $topic = "$main_topic > $sub_topic";
    my $sid = $cgi->cookie('CGISESSID');
    my $session = CGI::Session->new( $sid );
    my $name = $session->param("usr_name"); 
    my $uid = get_user_id_by_name_from_db ( $name);
    my @Qlist = get_qid_n_qtxt ($mpid,$spid,$uid);
    
    my $PageHeader = $page_function_hash{$param}->{'pHeader'};
    print $cgi->header( );
    print $cgi->start_html($PageHeader);
    $H3 =~ s/%NAME%/$name/;
    print $H3;
    
    my $data = {
                  info => \@Qlist,
                  topic => $topic 
               };
    my $out = ''; 
    my $tt = Template->new;
        $tt->process('q_list.html', $data, \$out)
        || die $tt->error;
      print $out;
      print $cgi->end_html(); 
}

sub F_ShowThread{
    my ($cgi) = @_;
    my $param = $cgi->{'AppParam'};
    my $qid = $cgi->param('QID');
    my ($mpid, $spid) = get_mpid_spid_by_qid($qid);
    my $sub_topic = get_sub_topic_name ( $mpid, $spid );
    my $main_topic = get_main_topic_name_by_mpid ( $mpid);
    my $topic = "$main_topic > $sub_topic";
    my $sid = $cgi->cookie('CGISESSID');
    my $session = CGI::Session->new( $sid );
    my $name = $session->param("usr_name"); 
    my $quesation = get_quesation_by_qid($qid);
    my $PageHeader = $page_function_hash{$param}->{'pHeader'};
    print $cgi->header( );
    print $cgi->start_html($PageHeader);
    $H4 =~ s/%NAME%/$name/;
    $H4 =~ s/%MPID%/$mpid/;

    print $H4;
    my @Dlist = get_all_discussion ($qid);
    my $data = {
                  topic => $topic,
                  quesation => $quesation,
                  info => \@Dlist,
                  qid => $qid
               };
    my $out = '';
   # print Dumper \@Dlist;
    my $tt = Template->new;
        $tt->process('discussion.html', $data, \$out)
        || die $tt->error;
      print $out;
      print $cgi->end_html(); 
}

sub F_RESPOND_COMNT{
    my ($cgi) = @_;
    my $qid = $cgi->param('qid');  
    my $uname = $cgi->param('uname');
    my $param = $cgi->{'AppParam'};
    my $PageHeader = $page_function_hash{$param}->{'pHeader'};
    print $cgi->header( );
    print $cgi->start_html($PageHeader);
    $H6 =~ s/%NAME%/$uname/;
    
    my ($mpid, $spid) = get_mpid_spid_by_qid($qid);
    my $sub_topic = get_sub_topic_name ( $mpid, $spid );
    my $main_topic = get_main_topic_name_by_mpid ( $mpid);
    my $topic = "$main_topic > $sub_topic";
    $H6 =~ s/ORGI/$topic/g;
    print $H6;
    
    my $quesation = get_quesation_by_qid($qid);
    my @Dlist = get_all_discussion ($qid);
    my $data = {
                  name => $uname,
                  quesation => $quesation,
                  info => \@Dlist,
                  qid => $qid
               };
     
    my $out = '';
   # print Dumper \@Dlist;
    my $tt = Template->new;
        $tt->process('F_discussion.html', $data, \$out)
        || die $tt->error;
      print $out;
      print $cgi->end_html();  
     
}

sub F_NEW_USER{
    my ($cgi) = @_;
    my $param = $cgi->{'AppParam'};
    my $PageHeader = $page_function_hash{$param}->{'pHeader'};
    print $cgi->header( );
    print $cgi->start_html($PageHeader);
    my $out;    
    my $tt = Template->new;
        $tt->process('new_user_reg.html', undef, \$out)
        || die $tt->error;
   print $out;  
   print $cgi->end_html();
}
