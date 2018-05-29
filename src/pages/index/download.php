  <?
	$filename = 'music.m4a';
	header('content-disposition:attachment;filename'.basename($filename));
	header('content-length:'.filesize($filename));
	readfile($filename);
  ?>