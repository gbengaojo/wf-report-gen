<?php

function getDirContents($dir, &$results = array()) {
   $files = scandir($dir);

   foreach ($files as $key => $value) {
      $path = realpath($dir . DIRECTORY_SEPARATOR . $value);

      if (!is_dir($path)) {
         $results[] = $path;
      } else if ($value != '.' && $value != '..') {
         getDirContents($path, $results);
         $results[] = $path;
      }
   }

   return $results;
}


// print help
if (empty($argv[1])) {
   echo "Usage: scan <DIRECTORY>\n";
   exit;
}

// put all files into array
$results = getDirContents($argv[1]);
// print_r($results);

// define regex for scanning
$regex = array(
   '/.{0,100}ISbot.{0,100}/', 
   '/.{0,100}\$sF\[\d]\].{0,100}/i',
   '/.{0,100}\$mik3\[\d]\].{0,100}/i',
   '/.{0,100}pussy.{0,100}/i',
   '/.{0,100}chr\(\d\).{0,100}/i',
   '/.{0,100}\$GLOBALS\[\$GLOBALS.{0,100}/i',
   '/.{0,100}obfuscat.{0,100}/i',
   '/.{0,100}\$\w+\^\'.{0,100}/i',
   '/.{0,100}@fopen.{0,100}/i',               // returns false positives
);

// for each file in $results
   // for each regular expression in $regex
      // test the file for the $regex
 
$output = '';
foreach ($results as $filename) {               // for ($i = 0; $i < count($results); $i++) {
   $fileinfo = pathinfo($filename);

   if (@$fileinfo['extension'] == 'php') {                      // todo: just for now

       $subject = file_get_contents($filename);
       $timestamp = @date("F d, Y H:i:s", filemtime($filename));   // todo: see PHP date() warning

       foreach ($regex as $pattern) {               // for ($j = 0; $j < count($regex); $j++) {
          if (preg_match($pattern, $subject, $matches)) {
             $output .= "$filename\t$timestamp\ncontext: " . $matches[0] . "\n__________________________\n";
          }
       }
   }
}

echo "Results:\n\n$output";
