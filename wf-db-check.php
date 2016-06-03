<?php
/* author:  colette chamberland
   contact: colette@wordfence.com
   version: 1.2, added from G267, wp_paged
   descrip: Basic tool to  use wordpress wp-config to connect to users db and do some basic checks 
   updates: Added htmlentities output/textarea on recs so they display properly when infected code is detected & self delete after run
*/
//connect to clients db, do some basic checks
error_reporting(0); //disable error output
include 'wp-config.php';
$host = DB_HOST;
$user = DB_USER;
$pass = DB_PASSWORD;
$name = DB_NAME;
$tbl_pre = $table_prefix; 
$con = mysql_connect($host, $user, $pass);
if (!$con) {
   die('Could not connect: ' . mysql_error());
} 
if(mysql_select_db($name, $con)) { 
      //this won't  work if they are using a custom users table
      $sql = "select id, user_login from " . $tbl_pre . "users where id = (select user_id from " . $tbl_pre . "usermeta where meta_key = 'wp_user_level' and meta_value > 7 and user_id > 1)";
      echo getResults($sql);
    //now check for a few odd wp_options
    $sql = "Select * from  " . $tbl_pre . "options where "; 
    $sql1 = $sql . "lower(option_value) like '%hacked by%'";
    echo getResults($sql1);
    $sql2 = $sql . "lower(option_name) = 'blog_charset' and option_value != 'UTF-8' ";  //look for non standard change
    echo getResults($sql2);
    $sql3 = $sql . "lower(option_value) like '%+adw-/title+ad4%'"; 
    echo getResults($sql3);
    $sql4 = $sql . "lower(option_name) = 'widget_text' and (lower(option_value) like '%\%48\%61\%43\%' or lower(option_value) like '%<script>%' or lower(option_value) like '%unescape\(%')";
    echo getResults($sql4);
    $sql5 = $sql . "lower(option_value) like '%tpircs%' or lower(option_value) like '%ptth%'  or lower(option_value) like '%wp_paged%' or lower(option_name) like '%head_z%'";
    echo getResults($sql5);
    //have to go through my stuff and find the db infections that use this, I know there are some out there
    //now check for spam & js injections
    $sql = "select * from " . $tbl_pre . "posts where post_status='publish' and ";
    //common seo tricks - post author injected is 0, hidden divs 
    $sql1 = $sql . "(post_author=0  or lower(post_content) like '%display:none;%' or lower(post_content) like '%text-decoration:none%' or 
       lower(post_content) like '%viagra%' or lower(post_content) like '%porn%' or lower(post_content) like '%cialis%' or lower(post_content) 
       like '%pharma%' or lower(post_content) like '%weight loss%' or lower(post_content) like '%casino%' or lower(post_content) like '%betting%'
       or lower(post_content) like '%designer%' or lower(post_content) like '%lamisil%' or lower(post_content) like '%gambling%') ";      
      echo getResults($sql1);
} else { 
      die('Could not select database: ' .$name);
};
function getResults($sql) { 
      $result = mysql_query($sql);
       if (!$result)
    {
        echo('Invalid query - possible issue? : ' . htmlentities($sql) . " ERROR: " . mysql_error());
         echo "<br />";
        return;
    } else { 
         $rows = mysql_affected_rows();
         if($rows > 0) { 
            printf("<strong>***WARNING - Potentially Suspicious Records found: %d\n</strong>", $rows);
            echo "<br />\n";
         
         //make this look pretty later....
         while($i < $rows)
        {
            echo "<textarea rows=10 cols=80>";
           echo htmlentities(print_r(mysql_fetch_assoc($result)));
           echo "</textarea>";
           echo "<br /><br />\n";
            $i++;
        } 
        } else { 
         echo "No malicious data found for query: " . htmlentities($sql) . "<br /><br />";
        }
    } 
   
}
//now we are done running, we hav our output, auto remove this file so nobody forgets about it
unlink(__FILE__);
