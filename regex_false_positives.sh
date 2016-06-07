#!/bin/bash
find . -type f -exec grep -li '|' {} /dev/null \;
find . -type f -exec grep -li "'=\$_COOKIE;'" {} /dev/null \;
find . -type f -exec grep -li 'substr(md5(\$_GET[' {} /dev/null \;
find . -type f -exec grep -li "\$_REQUEST\['password'\]" {} /dev/null \;
find . -type f -exec grep -li "\$_REQUEST\['passsword'\]" {} /dev/null \;
find . -type f -exec grep -li '!/usr/bin/php -q' {} /dev/null \;
find . -type f -exec grep -li 'chr(115)' {} /dev/null \;
find . -type f -exec grep -li 'x64' {} /dev/null \;
find . -type f -exec grep -li "\['2'\]" {} /dev/null \;
find . -type f -exec grep -li "\['3'\]" {} /dev/null \;
find . -type f -exec grep -li "\['6'\]" {} /dev/null \;
