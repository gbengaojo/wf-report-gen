#!/bin/bash

# find . -type f -newermt 2016-05-06 ! -newermt 2016-05-7  (time span: http://stackoverflow.com/questions/158044/how-to-use-find-to-search-for-files-created-on-a-specific-date)
# find . -name "*php*" -type f -exec sh -c 'test `wc -l {} | cut -f1 -d" "` -gt "100"' \; -print
# find . -type f -size +100M
# grep -r -m 1 "^"  <Your Root> | grep "^Binary file"       -- list binary files


# 6/16/2016 - From Ticket #21627
find . -type f -name '*php*' -exec grep -li 'vonumyx' {} /dev/null \;
find . -type f -name '*php*' -exec grep -li '\/\*;\*\/' {} /dev/null \;
find . -type f -name '*php*' -exec grep -li "if (\$_REQUEST\['param1'\]&&\$_REQUEST\['param2'\])" {} /dev/null \;
find . -type f -name '*php*' -exec grep -liP '(\\x[0-9a-z]{2}){5,}' {} /dev/null \;
find . -type f -name '*php*' -exec grep -liP '(\$\w+\[\d+\]\.){2,}' {} /dev/null \;
find . -type f -name '*php*' -exec grep -liP '(\\\d+){2,}' {} /dev/null \;


find . -type f -name '*php*' -exec grep -li 'chr(115)' {} /dev/null \;
find . -type f -name '*php*' -exec grep -li 'viagra' {} /dev/null \;
find . -type f -name '*php*' -exec grep -li '\$GLOBALS\[\$GLOBALS' {} /dev/null \;
find . -type f -name '*php*' -exec grep -li 'obfuscat' {} /dev/null \;
find . -type f -name '*php*' -exec grep -li "\$[a-z]\{1,\}\^'" {} /dev/null \;       # matches, e.g., $tef^' see wp-content/themes/index.php
find . -type f -name '*php*' -exec grep -li '%[0-9]title%[0-9]' {} /dev/null \;      # matches, e.g., %1title%2 -- see wp-content/cache_bak/patrician.php
find . -type f -name '*php*' -exec grep -li '"h"."tac"."c"."es"."s"' {} /dev/null \;
find . -type f -name '*php*' -exec grep -li '46esab' {} /dev/null \;
find . -type f -name '*php*' -exec grep -li 'magic Include' {} /dev/null \;
find . -type f -name '*php*' -exec grep -li 'webadmin' {} /dev/null \;
find . -type f -name '*php*' -exec grep -li 'cgishell' {} /dev/null \;
find . -type f -name '*php*' -exec grep -li 'windows-125' {} /dev/null \;
find . -type f -name '*php*' -exec grep -li 'filesman' {} /dev/null \;
find . -type f -name '*php*' -exec grep -li 'sh3ll' {} /dev/null \;
find . -type f -name '*php*' -exec grep -li 'web-shell' {} /dev/null \;
find . -type f -name '*php*' -exec grep -li 'c999sh' {} /dev/null \;
find . -type f -name '*php*' -exec grep -li 'edoced_46esab' {} /dev/null \;
find . -type f -name '*php*' -exec grep -li 'base64_decode' {} /dev/null \;
find . -type f -name '*php*' -exec grep -li 'basez6z4z_zdzezczode' {} /dev/null \;
find . -type f -name '*php*' -exec grep -li 'biaisie6i4i_dieicoide' {} /dev/null \;
find . -type f -name '*php*' -exec grep -li 'hacked by' {} /dev/null \;
find . -type f -name '*php*' -exec grep -li 'eval/*' {} /dev/null \;
find . -type f -name '*php*' -exec grep -li '"6"."4"."_"."de"' {} /dev/null \;
find . -type f -name '*php*' -exec grep -li '"Cr"."eat"."e_fun"."cti"."on"' {} /dev/null \;
find . -type f -name '*php*' -exec grep -li 'preg_replace("/.*/e"' {} /dev/null \;
find . -type f -name '*php*' -exec grep -li "'/a/e','e'.'v'.'a'.'l'.'" {} /dev/null \;
find . -type f -name '*php*' -exec grep -li '"b".""."".""."a"."s"."".""."".""."".""."e"."".""."6"."".""."4"."_".""."".""."de".""."c"."o".""."".""."".""."d".""."".""."e"', {} /dev/null \;
find . -type f -name '*php*' -exec grep -li "'base'.'64_decod'.'e'" {} /dev/null \;
find . -type f -name '*php*' -exec grep -li '"e"."v"."a"."l"."' {} /dev/null \;
find . -type f -name '*php*' -exec grep -li '"b" . "a" . "s" . "e" .' {} /dev/null \;
find . -type f -name '*php*' -exec grep -li 'base"."64_decod"."e' {} /dev/null \;
find . -type f -name '*php*' -exec grep -li "(edoced_46esab(lave'))" {} /dev/null \;
find . -type f -name '*php*' -exec grep -li 'strrev(' {} /dev/null \;
find . -type f -name '*php*' -exec grep -li '\$ADODB_ROUND' {} /dev/null \;
find . -type f -name '*php*' -exec grep -li '<script>var a="' {} /dev/null \;
find . -type f -name '*php*' -exec grep -li '"ass"."ert";' {} /dev/null \;
find . -type f -name '*php*' -exec grep -li "\'ass\'.\'ert\';" {} /dev/null \;
find . -type f -name '*php*' -exec grep -li '"as" . "se". "rt"' {} /dev/null \;
find . -type f -name '*php*' -exec grep -li '"_PO"."ST"' {} /dev/null \;
find . -type f -name '*php*' -exec grep -li '/(.*)/e' {} /dev/null \;
find . -type f -name '*php*' -exec grep -li "\$pass=@md5($_POST['pass']);" {} /dev/null \;
# ---
# ---

find . -type f -name '*php*' -exec grep -liP '<\?php /\*.*\*/\s*preg_replace' {} /dev/null \;
find . -type f -name '*php*' -exec grep -liP '/\*[\w+,+]+\*/' {} /dev/null \;
find . -type f -name '*php*' -exec grep -liP '\$[a-zA-Z0-9]{2,6}(\=\s|\s\=|\=)(strtolower|strtoupper)(\(|\s\()' {} /dev/null \;
find . -type f -name '*php*' -exec grep -liP 'var \_[0-9a-zA-Z]{6}\=' {} /dev/null \;
find . -type f -name '*php*' -exec grep -liP '\$[a-zA-Z0-9]{1}\_{1,4}[a-zA-Z0-9]\_{1,4}' {} /dev/null \;
find . -type f -name '*php*' -exec grep -liP '\$\_{1}[a-zA-Z]{1}\_{1}[a-zA-Z]\_' {} /dev/null \;
find . -type f -name '*php*' -exec grep -liP '\/\*[0-9a-zA-Z]{32,}\*\/' {} /dev/null \;
find . -type f -name '*php*' -exec grep -liP '\$[a-z]+=\$_COOKIE' {} /dev/null \;
find . -type f -name '*php*' -exec grep -liP 'if\(isset\(\$_(REQUEST|POST|GET|COOKIE)\["[A-Za-z0-9]+"\]\)\) \$_(REQUEST|POST|GET|COOKIE)\["[A-Za-z0-9]+"\]\(\$_(REQUEST|POST|GET|COOKIE)\["[A-Za-z0-9]+"\]\)' {} /dev/null \;
