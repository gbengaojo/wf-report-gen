#!/usr/bin/php
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

$dir = '';
$fileonly = false;
$include_regex = false;
$prog = array_shift($argv);

$usage_msg = <<<EOT
------------------------
Usage:
%s [OPTIONS] <DIRECTORY>

[OPTIONS]
   -f print only filename and path

EOT;

// print help
if (sizeof($argv) == 0) {
   echo sprintf($usage_msg, $prog);
   exit(0);
}

while (count($argv) > 0) {
   $arg = array_shift($argv);
   if (preg_match('/^-[h|\?]/', $arg)) {
      echo sprintf($usage_msg, $prog);
      exit(0);
   } else if (preg_match('/^-f/', $arg)) {
      $fileonly = true;
      $dir = array_shift($argv);
      if (empty($dir)) $dir = '.';
   } else if (is_file($arg) | is_dir($arg)) {
      $dir = $arg;
   } else {
      $dir = '.';
   }
}

// put all files into array
$results = getDirContents($dir);
// print_r($results);

// define regex for scanning
$regex = array(
   '/.{0,100}ISbot.{0,100}/', 
   '/.{0,100}\$sF\[\d]\].{0,100}/i',
   '/.{0,100}\$mik3\[\d]\].{0,100}/i',
   '/.{0,100}pussy.{0,100}/i',
   '/.{0,100}\$GLOBALS\[\$GLOBALS.{0,100}/i',
   '/.{0,100}obfuscat.{0,100}/i',
   '/.{0,100}\$\w+\^\'.{0,100}/i',
   '/.{0,100}[0-9a-zA-Z\/\.\+]{32, 64}.{0,100}/i', 
   '/.{0,100}[\'|"]str[\'|"]\.[\'|"]_rot[\'|"]\.[\'|"]1[\'|"]\.[\'|"]3[\'|"].{0,100}/i',
   '/.{0,100}\$[a-zA-Z0-9]{2,6}(\=\s|\s\=|\=)(strtolower|strtoupper)(\(|\s\().{0,100}/i',
   // the following matches, e.g., "if( isset( ${$uvn41}['qf385ab' ])){ eval
   '/.{0,100}if\([\s]*isset\([\s]*\$\{\$\w+\}\[[\s]*[\'|"]\w+[\'|"][\s]*\]*\)[\s]*\)[\s]*\{[\s]*[eval|sprintf].{0,100}/i',  

   // the following will return several false positives
   // use the thorough flag to indicate they're execution
   '/.{0,100}@fopen.{0,100}/i',
   '/.{0,100}chr\(\d\).{0,100}/i',
);

// for each file in $results
   // for each regular expression in $regex
      // test the file for the $regex
 
$output = '';
$result_count = 0;
foreach ($results as $filename) {               // for ($i = 0; $i < count($results); $i++) {
   $fileinfo = pathinfo($filename);

   if (@$fileinfo['extension'] == 'php') {                      // todo: just for now

       $subject = file_get_contents($filename);
       $timestamp = @date("F d, Y H:i:s", filemtime($filename));   // todo: see PHP date() warning

       foreach ($regex as $pattern) {               // for ($j = 0; $j < count($regex); $j++) {
          if (preg_match($pattern, $subject, $matches)) {
             $result_count += 1;
             if ($fileonly) {
               $output .= "$filename\n";
             } else {
               $include_regex = true;
               if ($include_regex) $output .= "regex used: $pattern\n";
               $output .= "$filename\t$timestamp\ncontext: " . trim($matches[0]) . "\n__________________________\n";
             }
          }
       }
   }
}

echo "$result_count Result(s):\n\n$output\n\nTotal Results: $result_count\n\n";
