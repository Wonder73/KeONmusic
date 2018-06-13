  <?php
	$file = 'http://dl.stream.qqmusic.qq.com/C400004TN6SP1LdZx3.m4a?vkey=84DC013F5BE6B7037E57ABEE2AF6E41ACBD782662DC15ADEA9D6F56C120B8942DFF4CD5B7390A653145474F7761A4181D57FE855B2A2D1DE&guid=984497069&uin=1491733348&fromtag=66';
	ob_clean();
	if(file_exists($file)){
	header("Content-type:application/octet-stream");
	$filename = basename($file);
	header("Content-Disposition:attachment;filename = 111.m4a");
	header("Accept-ranges:bytes");
	header("Accept-length:".filesize($file));
	readfile($file);
	}else{
		$filename = '111.m4a';
		$content = file_get_contents($file);
		file_put_contents($filename,$content);	
		header("Content-type:application/octet-stream");
		header("Content-Disposition:attachment;filename = {$filename}");
		header("Accept-ranges:bytes");
		header("Accept-length:".filesize($filename));
		readfile($filename);
	}
  ?>