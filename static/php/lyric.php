 <?php

	$refer = 'https://y.qq.com/portal/player.html';
	$url = 'https://c.y.qq.com/lyric/fcgi-bin/fcg_query_lyric_new.fcg?callback=MusicJsonCallback_lrc&pcachetime=1527234530336&songmid='.$_GET['songmid'].'&g_tk=5381&jsonpCallback=MusicJsonCallback_lrc&loginUin=0&hostUin=0&format=jsonp&inCharset=utf8&outCharset=utf-8&notice=0&platform=yqq&needNewCode=0';

	$opt=array('http'=>array('header'=>"Referer: $refer"));

	$context=stream_context_create($opt);

	$file_contents = file_get_contents($url,false, $context);
	$code = json_decode(substr($file_contents,stripos($file_contents,'(')+1,-1));
	echo base64_decode($code->lyric);

	 ?>
