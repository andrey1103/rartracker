<?php

function matchRegex($strContent, $strRegex, $intIndex = null) {
	    preg_match_all($strRegex, $strContent, $arrMatches);

//echo "$strContent";

	    if ($arrMatches === FALSE) return false;
	   
           if ($intIndex != null && is_int($intIndex)) {
	        if ($arrMatches[$intIndex]) {
	            return $arrMatches[$intIndex][0];
	        }
	        return false;

	    }
	    return $arrMatches;
	}




$file = 'logtxt';
// Open the file to get existing content
$data = file_get_contents($file);



		$info["tagline"] = '';
		if (@preg_match('!class="summary_text" itemprop="description">(\s*(.*?)\s*)</div>!ims',$data,$match)) {
			$info["tagline"] = trim($match[2]);
		}

echo trim($match[2]);
