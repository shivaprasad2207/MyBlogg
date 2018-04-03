
function logout( sid ){
    var xmlhttp;
    var url = '/cgi-bin/My-Blog/debug.pl?term=' + sid  + '&flag=' + 'logout';
    
    if (window.XMLHttpRequest){// code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp=new XMLHttpRequest();
    }else{// code for IE6, IE5
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.open("GET",url,false);
    xmlhttp.send();
    var ret = xmlhttp.responseText;
    window.location = '/cgi-bin/My-Blog/login.pl?status=logout';
}