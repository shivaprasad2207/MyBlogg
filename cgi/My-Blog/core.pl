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
require CGI::Session;
use Data::Dumper;
require ("debug.pl");
use CGI::Carp qw(fatalsToBrowser);
use JSON;
our  $MainPageHeader;
use Time::Local;
use Date::Manip;
use POSIX qw/strftime/;
use MIME::Lite;
use MIME::Parser;
use Email::MIME::Attachment::Stripper;


my $cgi = CGI->new();
my $flag = $cgi->param('flag');

if( $flag eq 'SUBSCRIBE'){
   my $mpid = $cgi->param('mpid');
   my $spid = $cgi->param('spid');
   my $sid = $cgi->cookie('CGISESSID');
   my $session = CGI::Session->new( $sid );
   my $name = $session->param("usr_name"); 
   my $uid = get_user_id_by_name_from_db ( $name);
   my $ret = subscribe_user ( $mpid, $spid, $uid, '1'  );
   my $sub_topic_name = get_sub_topic_name_by_spid ( $spid);
   my $main_topic_name = get_main_topic_name_by_mpid ( $mpid);
   print "Content-type: text/plain; charset=iso-8859-1\n\n";
   print "<br><br>&nbsp &nbsp&nbsp&nbsp&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp&nbsp";
   print "<b style=\"font-family:Times New Roman, serif; font-size:20px;color:blue\">Subscription is Done for&nbsp&nbsp &nbsp&nbsp
          [ $main_topic_name>$sub_topic_name  
           &nbsp&nbsp&nbsp&nbsp&nbsp for $name </b>
          ";
          
}elsif ( $flag eq 'UNSUBSCRIBE'){
   my $mpid = $cgi->param('mpid');
   my $spid = $cgi->param('spid');
   my $sid = $cgi->cookie('CGISESSID');
   my $session = CGI::Session->new( $sid );
   my $name = $session->param("usr_name"); 
   my $uid = get_user_id_by_name_from_db ( $name);
   my $ret = subscribe_user ( $mpid, $spid, $uid , '0' );
   my $sub_topic_name = get_sub_topic_name_by_spid ( $spid);
   my $main_topic_name = get_main_topic_name_by_mpid ( $mpid);
   print "Content-type: text/plain; charset=iso-8859-1\n\n";
   print "<br><br>&nbsp &nbsp&nbsp&nbsp&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp&nbsp";
   print "<b style=\"font-family:Times New Roman, serif; font-size:20px;color:blue\">Un-Subscription is Done for&nbsp&nbsp 
          [ $main_topic_name>$sub_topic_name  
           &nbsp&nbsp for $name </b>
          ";
   
}elsif ( $flag eq 'MAKE_QUESATION'){
   my $mpid = $cgi->param('mpid');
   my $spid = $cgi->param('spid');
   my $sid = $cgi->cookie('CGISESSID');
   my $session = CGI::Session->new( $sid );
   my $name = $session->param("usr_name"); 
   my $uid = get_user_id_by_name_from_db ( $name);
   
}elsif ( $flag eq 'IS_SUBSCRIBED'){
   my $mpid = $cgi->param('mpid');
   my $spid = $cgi->param('spid');
   my $sid = $cgi->cookie('CGISESSID');
   my $session = CGI::Session->new( $sid );
   my $name = $session->param("usr_name"); 
   my $uid = get_user_id_by_name_from_db ( $name);
   my $ret = is_user_subscribed ( $mpid, $spid, $uid );
   print "Content-type: text/plain; charset=iso-8859-1\n\n";
   if ( $ret == 1){
      print "1";
   }else{
      print "<br><br>Your are not subscribed for this Topic<br>";
   }
}elsif ( $flag eq 'SHOW_FORM_Q_DIALOG'){
   my $mpid = $cgi->param('mpid');
   my $spid = $cgi->param('spid');
   my $sid = $cgi->cookie('CGISESSID');
   my $session = CGI::Session->new( $sid );
   my $name = $session->param("usr_name"); 
   my $uid = get_user_id_by_name_from_db ( $name);
   my $data ={
             uid => $uid,
             mpid => $mpid,
             spid => $spid
   };
    
    
    my $out1;
    my $tt = Template->new;
        $tt->process('show_form_q_dialog.html', $data ,\$out1)
        || die $tt->error;
    print "Content-type: text/plain; charset=iso-8859-1\n\n";    
    print $out1;
}elsif ( $flag eq 'ADD_Q'){
   
   my $sid = $cgi->cookie('CGISESSID');
   my $session = CGI::Session->new( $sid );
   my $name = $session->param("usr_name");
   
   my $mpid = $cgi->param('mpid');
   my $spid = $cgi->param('spid');
   my $uid = $cgi->param('uid');
   my $mesg_text = $cgi->param('description');
   my $que_text = $cgi->param('quesation');
   my $msg_time = strftime('%Y-%m-%d %H:%M:%S',localtime); 
   my $qid  =       create_uniq_string (8);
   
   my $sql = "insert into quesation values ( \'$mpid\',  \'$spid\', \'$uid\', \'$qid\',  \'$que_text\' ) ;" ;
   my $ret =  add_new_quesation ( $sql);
   $sql = "insert into discussion values ( \'$qid\', \'$uid\', \'$msg_time\', \'$mesg_text\' ) ;" ;
   $ret =  add_new_quesation ( $sql);
   
   update_subscribed_user( $name , $qid , $mesg_text , $msg_time );
   print "Content-type: text/plain; charset=iso-8859-1\n\n";    
   print "<br><br> <b>Your quesation updated to all subscribed </b>";
}elsif ( $flag eq 'ADD_COMMENT_TO_THREAD'){
   my $text = $cgi->param('text');
   my $qid = $cgi->param('qid');
   my $sid = $cgi->cookie('CGISESSID');
   my $session = CGI::Session->new( $sid );
   my $name = $session->param("usr_name"); 
   my $uid = get_user_id_by_name_from_db ( $name);
   my $msg_time = strftime('%Y-%m-%d %H:%M:%S',localtime); 
   my $sql = "insert into discussion values ( \'$qid\', \'$uid\', \'$msg_time\', \'$text\' ) ;" ;
   my $ret =  add_new_quesation ( $sql);
   
   update_subscribed_user( $name , $qid , $text , $msg_time);
   
   print "Content-type: text/plain; charset=iso-8859-1\n\n";    
   print "<br><br> <b>Your commetns updated to all subscribed </b>";
   
}elsif ( $flag eq 'F_ADD_COMMENT_TO_THREAD'){
   my $text = $cgi->param('text');
   my $qid = $cgi->param('qid');
   my $name = $cgi->param("name"); 
   my $uid = get_user_id_by_name_from_db ( $name);
   my $msg_time = strftime('%Y-%m-%d %H:%M:%S',localtime); 
   my $sql = "insert into discussion values ( \'$qid\', \'$uid\', \'$msg_time\', \'$text\' ) ;" ;
   my $ret =  add_new_quesation ( $sql);
   
   update_subscribed_user( $name , $qid , $text , $msg_time);
   
   print "Content-type: text/plain; charset=iso-8859-1\n\n";    
   print "<br><br> <b>Your commetns updated to all subscribed </b>";
}elsif ( $flag eq 'PASSWD_CHANGE_FORM'){
   my $sid = $cgi->cookie('CGISESSID');
   my $session = CGI::Session->new( $sid );
   my $name = $session->param("usr_name"); 
   my $uid = get_user_id_by_name_from_db ( $name);
   my $data ={
             uid => $uid,
             user_name => $name,
   };
    my $out1;
    my $tt = Template->new;
        $tt->process('change_passwd.html', $data ,\$out1)
        || die $tt->error;
    print "Content-type: text/plain; charset=iso-8859-1\n\n";    
    print $out1;
}elsif ( $flag eq 'PASSWD_CHANGE_SUBMIT'){
   my $sid = $cgi->cookie('CGISESSID');
   my $session = CGI::Session->new( $sid );
   my $name = $session->param("usr_name"); 
   my $uid = get_user_id_by_name_from_db ( $name);
   my $old_passwd = $cgi->param('old_passwd');
   my $new_passwd = $cgi->param('passwd_1');
   print "Content-type: text/plain; charset=iso-8859-1\n\n"; 
   if (verify_old_passwd ( $name, $old_passwd  )){
      my $sql = "update user_info set user_passwd=\'$new_passwd\' WHERE user_name=\'$name\'; ";
      my $ret = change_user_passwd ( $sql );
      print "<b> User Name: $name &nbsp&nbsp&nbsp&nbsp&nbsp Password changed ! </b>";   
      exit (0);
   }else{
      print "<b> old passwd entered Wrong Try again </b>";   
      exit (0);
   }
}elsif ( $flag eq 'EMAIL_CHANGE_FORM'){
   my $sid = $cgi->cookie('CGISESSID');
   my $session = CGI::Session->new( $sid );
   my $name = $session->param("usr_name"); 
   my $uid = get_user_id_by_name_from_db ( $name);
   my $email =   get_user_email_by_name ( $name);
   my $data ={
             email=> $email,
             uid => $uid,
             user_name => $name,
   };
    my $out1;
    my $tt = Template->new;
        $tt->process('email_change.html', $data ,\$out1)
        || die $tt->error;
    print "Content-type: text/plain; charset=iso-8859-1\n\n";    
    print $out1;
}elsif ( $flag eq 'EMAIL_CHANGE_SUBMIT'){
   my $sid = $cgi->cookie('CGISESSID');
   my $session = CGI::Session->new( $sid );
   my $name = $session->param("usr_name"); 
   my $uid = get_user_id_by_name_from_db ( $name);
   my $new_email = $cgi->param('new_email');
   my $sql = "update user_info set user_email=\'$new_email\' WHERE user_name=\'$name\'; ";
   my $ret = change_user_email ( $sql );
   print "Content-type: text/plain; charset=iso-8859-1\n\n"; 
   print "<b> New EmailId Updated For User $name </b>";   
   exit (0);
}elsif ( $flag eq 'NAME_CHANGE_FORM'){
   my $sid = $cgi->cookie('CGISESSID');
   my $session = CGI::Session->new( $sid );
   my $name = $session->param("usr_name"); 
   my $uid = get_user_id_by_name_from_db ( $name);
   my ($fname, $lname) =   get_user_f_and_l_name_by_name ( $name);
   my $data ={
             
             fname=> $fname,
             lname=> $lname,
             uid => $uid,
             user_name => $name,
   };
    my $out1;
    my $tt = Template->new;
        $tt->process('name_change.html', $data ,\$out1)
        || die $tt->error;
    print "Content-type: text/plain; charset=iso-8859-1\n\n";    
    print $out1;
}elsif ( $flag eq 'NAME_CHANGE_SUBMIT'){
   my $sid = $cgi->cookie('CGISESSID');
   my $session = CGI::Session->new( $sid );
   my $name = $session->param("usr_name"); 
   my $uid = get_user_id_by_name_from_db ( $name);
   my $fname = $cgi->param('new_fname');
   my $lname = $cgi->param('new_lname');
   my $sql = "update user_info set FirstName=\'$fname\', LastName = \'$lname\'   WHERE user_name=\'$name\'; ";
   my $ret = change_user_email ( $sql );
   print "Content-type: text/plain; charset=iso-8859-1\n\n"; 
   print "<b> New First name and Last Name of User $name is Updated </b>";   
   exit (0);
}elsif ( $flag eq 'MY_SUBSCRIPTION'){
   my $sid = $cgi->cookie('CGISESSID');
   my $session = CGI::Session->new( $sid );
   my $name = $session->param("usr_name"); 
   print "Content-type: text/plain; charset=iso-8859-1\n\n"; 
   print "<b>
         <img hight=\"10px\" width=\"10px\" src=\"/static/images/My-Blog/pr.jpg\" />
         &nbsp&nbspticked topics are subscribed for User $name
       </b>";   
   exit (0);
}elsif ( $flag eq 'ADMIN_CONTACT_FORM'){
   my $sid = $cgi->cookie('CGISESSID');
   my $session = CGI::Session->new( $sid );
   my $name = $session->param("usr_name"); 
   my $uid = get_user_id_by_name_from_db ( $name);
   my ($fname, $lname) =   get_user_f_and_l_name_by_name ( $name);
   my $email =   get_user_email_by_name ( $name);
   my $full_name = $fname . ' ' .$lname ;
   my $data ={
             
             fname=> $fname,
             lname=> $lname,
             uid => $uid,
             user_name => $name,
             email => $email,
             full_name => $full_name
   };
    my $out1;
    my $tt = Template->new;
        $tt->process('admin_contact.html', $data ,\$out1)
        || die $tt->error;
    print "Content-type: text/plain; charset=iso-8859-1\n\n";    
    print $out1;
}elsif ( $flag eq 'NEW_MAIN_TOPIC_REQ_FORM'){
   my $sid = $cgi->cookie('CGISESSID');
   my $session = CGI::Session->new( $sid );
   my $name = $session->param("usr_name"); 
   my $uid = get_user_id_by_name_from_db ( $name);
   my ($fname, $lname) =   get_user_f_and_l_name_by_name ( $name);
   my $email =   get_user_email_by_name ( $name);
   my $full_name = $fname . ' ' .$lname ;
   my $data ={
             
             fname=> $fname,
             lname=> $lname,
             uid => $uid,
             user_name => $name,
             email => $email,
             full_name => $full_name
   };
    my $out1;
    my $tt = Template->new;
        $tt->process('req_new_main_topic.html', $data ,\$out1)
        || die $tt->error;
    print "Content-type: text/plain; charset=iso-8859-1\n\n";    
    print $out1;
}elsif ( $flag eq 'NEW_SUB_TOPIC_REQ_FORM'){
   my $sid = $cgi->cookie('CGISESSID');
   my $session = CGI::Session->new( $sid );
   my $name = $session->param("usr_name");
   my $mpid = $cgi->param('mpid');
   my $uid = get_user_id_by_name_from_db ( $name);
   my ($fname, $lname) =   get_user_f_and_l_name_by_name ( $name);
   my $email =   get_user_email_by_name ( $name);
   my $full_name = $fname . ' ' .$lname ;
   my $topic_name = get_main_topic_name_by_mpid ( $mpid );
   my $data ={
             
             fname=> $fname,
             lname=> $lname,
             uid => $uid,
             user_name => $name,
             email => $email,
             full_name => $full_name,
             topic_name => $topic_name,
             mpid => $mpid
   };
    my $out1;
    my $tt = Template->new;
        $tt->process('req_new_sub_topic.html', $data ,\$out1)
        || die $tt->error;
    print "Content-type: text/plain; charset=iso-8859-1\n\n";    
    print $out1;
}elsif ( $flag eq 'SEND_MAIL_TO_ADMIN'){
   my $sid = $cgi->cookie('CGISESSID');
   my $session = CGI::Session->new( $sid );
   my $name = $session->param("usr_name");
   my $email = $cgi->param('email');
   my $full_name = $cgi->param('full_name');
   my $subject_text = $cgi->param('subject_text');
   my $mail_text = $cgi->param('mail_text');
   $subject_text =~ s/^\s+//;$subject_text =~ s/\s+$//;
   $mail_text =~  s/^\s+//;$mail_text =~ s/\s+$//; 
   $mail_text = $mail_text. '****' . $email . '****' . $name ;
   
   my $from = 'support@fways.in';
   my $passwd = 'support';
   my $to = 'nnsprasad@gmail.com';
   MIME::Lite->send('smtp', "mail.fways.in:25", Timeout=>90, AuthUser=>$from, AuthPass=>$passwd); 
   my $msg = MIME::Lite->new( 
                    From => $from, 
                    To => $to,
                    Cc => $email, 
                    Subject => $subject_text, 
                    Type => 'TEXT', 
                    Encoding=> '7bit', 
                    Data => $mail_text
   ); 
  $msg->send();
  print "Content-type: text/plain; charset=iso-8859-1\n\n";
  print "<b style=\"font-family:Times New Roman, serif; font-size:20px;color:green\">" .
             "Mail Sent Successfully to Admin</b>";
}elsif ( $flag eq 'REQ_NEW_MAIN_TOPIC'){
   my $sid = $cgi->cookie('CGISESSID');
   my $session = CGI::Session->new( $sid );
   my $name = $session->param("usr_name");
   my $email = $cgi->param('email');
   my $full_name = $cgi->param('full_name');
   my $subject_text = $cgi->param('subject_text');
   $subject_text =~ s/^\s+//;$subject_text =~ s/\s+$//;
   $subject_text = 'ADD MAIN TOPIC:  ' .  $subject_text ; 
   my $mail_text = $subject_text. '****' . $email . '****' . $name ;
   my $from = 'support@fways.in';
   my $passwd = 'support';
   my $to = 'nnsprasad@gmail.com';
   MIME::Lite->send('smtp', "mail.fways.in:25", Timeout=>90, AuthUser=>$from, AuthPass=>$passwd); 
   my $msg = MIME::Lite->new( 
                    From => $from, 
                    To => $to,
                    Cc => $email, 
                    Subject => $subject_text, 
                    Type => 'TEXT', 
                    Encoding=> '7bit', 
                    Data => $mail_text
   ); 
  $msg->send();
  print "Content-type: text/plain; charset=iso-8859-1\n\n";
  print "<b style=\"font-family:Times New Roman, serif; font-size:20px;color:green\">" .
             "Mail Sent Successfully to Admin</b>";
}elsif ( $flag eq 'REQ_NEW_SUB_TOPIC'){
   my $sid = $cgi->cookie('CGISESSID');
   my $session = CGI::Session->new( $sid );
   my $name = $session->param("usr_name");

   my $email = $cgi->param('email');
   my $full_name = $cgi->param('full_name');
   my $subject_text = $cgi->param('subject_text');
   my $main_topic_name = $cgi->param('main_topic');
   $subject_text =~ s/^\s+//;$subject_text =~ s/\s+$//;
   $subject_text = 'ADD SUB TOPIC:  ' .  $subject_text. '  UNDER MAIN TOPIC  ' . $main_topic_name  ; 
   my $mail_text = $subject_text. '****' . $email . '****' . $name ;
   my $from = 'support@fways.in';
   my $passwd = 'support';
   my $to = 'nnsprasad@gmail.com';
   MIME::Lite->send('smtp', "mail.fways.in:25", Timeout=>90, AuthUser=>$from, AuthPass=>$passwd); 
   my $msg = MIME::Lite->new( 
                    From => $from, 
                    To => $to,
                    Cc => $email, 
                    Subject => $subject_text, 
                    Type => 'TEXT', 
                    Encoding=> '7bit', 
                    Data => $mail_text
   ); 
  $msg->send();
  print "Content-type: text/plain; charset=iso-8859-1\n\n";
  print "<b style=\"font-family:Times New Roman, serif; font-size:20px;color:green\">" .
             "Mail Sent Successfully to Admin</b>";
}elsif ( $flag eq 'VERIFY_USER_NAME_EXIST'){
     my $uname = $cgi->param ( 'uname');
     my @unames = get_all_login_names ();

     print "Content-type: text/plain; charset=iso-8859-1\n\n";
     if (grep(/$uname/, @unames)) {
         print "1"            
     }else{
         print "Further Process to be done";
      
     }
}elsif ( $flag eq 'SHOW_NEW_USER_REG_FORM'){
     my $uname = $cgi->param ( 'uname');
     my (%data,$out);
     $data{uname} = $uname;
     my $tt = Template->new;
     $tt->process('show_new_user_reg_form.html', \%data, \$out)
        || die $tt->error; 
     print "Content-type: text/plain; charset=iso-8859-1\n\n";
     print "<br><br><br>$out";
}elsif ( $flag eq 'REGISTER_THIS_USER'){
     my %params = $cgi->Vars;
     foreach my $param ( keys (%params )){
         $params{$param} =~ s/^\s+//;
         $params{$param} =~ s/\s+$//; 
     }
     my %data;
     my ($user_name, $user_passwd, $user_email, $mobile, $Address,  $FirstName, $LastName)
             = @params{ 'uname', 'uname', 'email', 'mobile', 'adress',  'fname', 'lname'};
     my $sql = "insert into user_info
                              ( user_name, user_passwd, user_email, mobile, Address,  FirstName, LastName )
                     values         
                           (\'$user_name\', \'$user_passwd\', \'$user_email\', \'$mobile\', \'$Address\', \'$FirstName\', \'$LastName\')
               ;";
      my $ret = register_new_user($sql);
      
      my $uid = get_user_id_by_name_from_db ( $user_name );
      $sql = "insert into usr_roles values ( \'$uid\', '0' );";
      $ret = regiseter_new_user_role( $sql); 
      print "Content-type: text/plain; charset=iso-8859-1\n\n";
      print '<b style="font-family:Arial, Helvetica,sans-serif;font-size: large;color:green;"> Your details are registered, You can login </b><br><br>';
      print '
             <a href="login.pl">  
                <b style="font-family:Arial, Helvetica,sans-serif;font-size: large;color:blue;"> Back to Login</b>
             </a>   
            ';  
}     

sub  update_subscribed_user {
 
 my( $name , $qid , $mesg_text , $msg_time ) = @_;
 my ($mpid,$spid) = get_mpid_spid_by_qid ( $qid);
 my @emails = get_all_subscribed_emails($mpid,$spid);
 my ($fname, $lname) =   get_user_f_and_l_name_by_name ( $name);
 my $email =  get_user_email_by_name ( $name);
 my $quesation = get_quesation_by_qid ($qid);

 my $subject = "My-Blogger Discussion: $quesation";
  $mesg_text =~ s/^\s+//;
  $mesg_text =~ s/\s+$//; 
 my $data = "Commented By : $fname,$lname [$email]  at $msg_time \n\r ". $mesg_text;
 
   foreach my $to ( @emails){
     
      $data = $data . '\n\r';       
      my $html_data =  ' <a href="http://localhost/cgi-bin/My-Blog/index.pl?AppParam=RESPOND_COMNT&qid=QID&uname=SUBSCRIBER"> Respond discussion </a>' ;  
      my $subscriber = get_name_by_email( $to );
      $html_data=~ s/SUBSCRIBER/$subscriber/g;
      $html_data=~ s/QID/$qid/g; 
      my @argv = ('perl',  './my_send_script.pl' , $to, $subject , $data, $html_data);
      
      if (fork){
         wait ();
      }else{
         exec @argv;  
      }   
          
   }   

} 


