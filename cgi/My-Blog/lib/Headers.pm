package lib::Headers;
require(Exporter);
use warnings;
use strict;
our @ISA = qw(Exporter);
our @EXPORT    = qw (
                      $MainPageHeader
                    );

our $MainPageHeader = {
                        -title => 'WEB My Blog',
                        -style=>[ 
                                       
                                       { -type =>'text/css', -src=>'/static/styles/My-Blog/bootstrap.css'},
                                       { -type =>'text/css', -src=>'/static/styles/My-Blog/bootstrap-responsive.css'},
                                       { -type =>'text/css', -src=>'/static/styles/My-Blog/jquery-ui-1.8.18.custom.css'},
                                       
                                    ],  
                         -script=>[
                                        
                                        { -type => 'text/javascript', -src => '/static/js/My-Blog/jquery.min.js'},
                                        { -type => 'text/javascript', -src => '/static/js/My-Blog/jquery.js'},
                                        { -type => 'text/javascript', -src => '/static/js/My-Blog/jquery.ui.core.js' },
                                        { -type => 'text/javascript', -src => '/static/js/My-Blog/jquery-ui-1.8.18.custom.min.js' },
                                        { -type => 'text/javascript', -src => '/static/js/My-Blog/pre_logout.js'},
                                        { -type => 'text/javascript', -src => '/static/js/My-Blog/dispatch.js'},
                                        { -type => 'text/javascript', -src => '/static/js/My-Blog/bootstrap.js'},
                                        
                                     ],
                    };
                       
1
;


                                       
                                       
                                       
                                        