function WHCreateCookie(name, value, days) {
    var date = new Date();
    date.setTime(date.getTime() + (days*24*60*60*1000));
    var expires = "; expires=" + date.toGMTString();
 document.cookie = name+"="+value+expires+"; path=/";
}
function WHReadCookie(name) {
 var nameEQ = name + "=";
 var ca = document.cookie.split(';');
 for(var i=0; i < ca.length; i++) {
  var c = ca[i];
  while (c.charAt(0) == ' ') c = c.substring(1, c.length);
  if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length, c.length);
 }
 return null;
}

window.onload = WHCheckCookies;

function WHCheckCookies() {
    if(WHReadCookie('cookies_accepted') != 'T') {
        var message_container = document.createElement('div');
        message_container.id = 'cookies-message-container';
        var html_code = '<div id="cookies-message" style="padding: 10px 0px; font-size: 14px; line-height: 22px; border-top: 2px solid #ADC2FF; text-align: center; position: fixed; bottom: 0px; background-color: #EFEFEF; width: 100%; z-index: 1999;"><span style="font-size: 20px;" class="glyphicon glyphicon-warning-sign"></span> Nasza strona używa ciasteczek (COOKIES), dzięki którym serwis może działać lepiej. Korzystanie z witryny oznacza zgodę na ich zapis <span style="font-size: 20px;" class="glyphicon glyphicon-warning-sign"></span><p><a href="javascript:WHCloseCookiesWindow();" id="accept-cookies-checkbox" name="accept-cookies" class="btn btn-primary" style="display: inline-block; margin-left: 10px; cursor: pointer;">Rozumiem</a></p></div>';
        message_container.innerHTML = html_code;
        document.body.appendChild(message_container);
    }
}

function WHCloseCookiesWindow() {
    WHCreateCookie('cookies_accepted', 'T', 365);
    document.getElementById('cookies-message-container').removeChild(document.getElementById('cookies-message'));
}
