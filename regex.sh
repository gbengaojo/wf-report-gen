#!/bin/bash

# find . -type f -newermt 2016-05-06 ! -newermt 2016-05-7  (time span: http://stackoverflow.com/questions/158044/how-to-use-find-to-search-for-files-created-on-a-specific-date)
# find . -name "*php*" -type f -exec sh -c 'test `wc -l {} | cut -f1 -d" "` -gt "100"' \; -print
# find . -type f -size +100M
# grep -r -m 1 "^"  <Your Root> | grep "^Binary file"       -- list binary files


# 6/16/2016 - From Ticket #21627
find . -type f -name '*php*' -exec grep -ni 'vonumyx' {} /dev/null \;
find . -type f -name '*php*' -exec grep -ni '\/\*;\*\/' {} /dev/null \;
find . -type f -name '*php*' -exec grep -ni "if (\$_REQUEST\['param1'\]&&\$_REQUEST\['param2'\])" {} /dev/null \;
find . -type f -name '*php*' -exec grep -niP '(\\x[0-9a-z]{2}){5,}' {} /dev/null \;
find . -type f -name '*php*' -exec grep -niP '(\$\w+\[\d+\]\.){2,}' {} /dev/null \;
find . -type f -name '*php*' -exec grep -niP '(\\\d+){2,}' {} /dev/null \;


find . -type f -name '*php*' -exec grep -ni 'chr(115)' {} /dev/null \;
find . -type f -name '*php*' -exec grep -ni 'viagra' {} /dev/null \;
find . -type f -name '*php*' -exec grep -ni '\$GLOBALS\[\$GLOBALS' {} /dev/null \;
find . -type f -name '*php*' -exec grep -ni 'obfuscat' {} /dev/null \;
find . -type f -name '*php*' -exec grep -ni "\$[a-z]\{1,\}\^'" {} /dev/null \;       # matches, e.g., $tef^' see wp-content/themes/index.php
find . -type f -name '*php*' -exec grep -ni '%[0-9]title%[0-9]' {} /dev/null \;      # matches, e.g., %1title%2 -- see wp-content/cache_bak/patrician.php
find . -type f -name '*php*' -exec grep -ni '"h"."tac"."c"."es"."s"' {} /dev/null \;
find . -type f -name '*php*' -exec grep -ni '46esab' {} /dev/null \;
find . -type f -name '*php*' -exec grep -ni 'magic Include' {} /dev/null \;
find . -type f -name '*php*' -exec grep -ni 'webadmin' {} /dev/null \;
find . -type f -name '*php*' -exec grep -ni 'cgishell' {} /dev/null \;
find . -type f -name '*php*' -exec grep -ni 'windows-125' {} /dev/null \;
find . -type f -name '*php*' -exec grep -ni 'filesman' {} /dev/null \;
find . -type f -name '*php*' -exec grep -ni 'sh3ll' {} /dev/null \;
find . -type f -name '*php*' -exec grep -ni 'web-shell' {} /dev/null \;
find . -type f -name '*php*' -exec grep -ni 'c999sh' {} /dev/null \;
find . -type f -name '*php*' -exec grep -ni 'edoced_46esab' {} /dev/null \;
find . -type f -name '*php*' -exec grep -ni 'base64_decode' {} /dev/null \;
find . -type f -name '*php*' -exec grep -ni 'basez6z4z_zdzezczode' {} /dev/null \;
find . -type f -name '*php*' -exec grep -ni 'biaisie6i4i_dieicoide' {} /dev/null \;
find . -type f -name '*php*' -exec grep -ni 'hacked by' {} /dev/null \;
find . -type f -name '*php*' -exec grep -ni 'eval/*' {} /dev/null \;
find . -type f -name '*php*' -exec grep -ni '"6"."4"."_"."de"' {} /dev/null \;
find . -type f -name '*php*' -exec grep -ni '"Cr"."eat"."e_fun"."cti"."on"' {} /dev/null \;
find . -type f -name '*php*' -exec grep -ni 'preg_replace("/.*/e"' {} /dev/null \;
find . -type f -name '*php*' -exec grep -ni "'/a/e','e'.'v'.'a'.'l'.'" {} /dev/null \;
find . -type f -name '*php*' -exec grep -ni '"b".""."".""."a"."s"."".""."".""."".""."e"."".""."6"."".""."4"."_".""."".""."de".""."c"."o".""."".""."".""."d".""."".""."e"', {} /dev/null \;
find . -type f -name '*php*' -exec grep -ni "'base'.'64_decod'.'e'" {} /dev/null \;
find . -type f -name '*php*' -exec grep -ni '"e"."v"."a"."l"."' {} /dev/null \;
find . -type f -name '*php*' -exec grep -ni '"b" . "a" . "s" . "e" .' {} /dev/null \;
find . -type f -name '*php*' -exec grep -ni 'base"."64_decod"."e' {} /dev/null \;
find . -type f -name '*php*' -exec grep -ni "(edoced_46esab(lave'))" {} /dev/null \;
find . -type f -name '*php*' -exec grep -ni 'strrev(' {} /dev/null \;
find . -type f -name '*php*' -exec grep -ni '\$ADODB_ROUND' {} /dev/null \;
find . -type f -name '*php*' -exec grep -ni '<script>var a="' {} /dev/null \;
find . -type f -name '*php*' -exec grep -ni '"ass"."ert";' {} /dev/null \;
find . -type f -name '*php*' -exec grep -ni "\'ass\'.\'ert\';" {} /dev/null \;
find . -type f -name '*php*' -exec grep -ni '"as" . "se". "rt"' {} /dev/null \;
find . -type f -name '*php*' -exec grep -ni '"_PO"."ST"' {} /dev/null \;
find . -type f -name '*php*' -exec grep -ni '/(.*)/e' {} /dev/null \;
find . -type f -name '*php*' -exec grep -ni "\$pass=@md5($_POST['pass']);" {} /dev/null \;
# ---
# ---

find . -type f -name '*php*' -exec grep -niP '<\?php /\*.*\*/\s*preg_replace' {} /dev/null \;
find . -type f -name '*php*' -exec grep -niP '/\*[\w+,+]+\*/' {} /dev/null \;
find . -type f -name '*php*' -exec grep -niP '\$[a-zA-Z0-9]{2,6}(\=\s|\s\=|\=)(strtolower|strtoupper)(\(|\s\()' {} /dev/null \;
find . -type f -name '*php*' -exec grep -niP 'var \_[0-9a-zA-Z]{6}\=' {} /dev/null \;
find . -type f -name '*php*' -exec grep -niP '\$[a-zA-Z0-9]{1}\_{1,4}[a-zA-Z0-9]\_{1,4}' {} /dev/null \;
find . -type f -name '*php*' -exec grep -niP '\$\_{1}[a-zA-Z]{1}\_{1}[a-zA-Z]\_' {} /dev/null \;
find . -type f -name '*php*' -exec grep -niP '\/\*[0-9a-zA-Z]{32,}\*\/' {} /dev/null \;
find . -type f -name '*php*' -exec grep -niP '\$[a-z]+=\$_COOKIE' {} /dev/null \;
find . -type f -name '*php*' -exec grep -niP 'if\(isset\(\$_(REQUEST|POST|GET|COOKIE)\["[A-Za-z0-9]+"\]\)\) \$_(REQUEST|POST|GET|COOKIE)\["[A-Za-z0-9]+"\]\(\$_(REQUEST|POST|GET|COOKIE)\["[A-Za-z0-9]+"\]\)' {} /dev/null \;
