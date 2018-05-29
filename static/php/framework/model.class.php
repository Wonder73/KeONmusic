<?php
/**
 * 基础模型类
 */
class model {
	protected $db; //保存数据库对象
	public function __construct(){
		$this->initDB(); // 初始化数据库
	}
	private function initDB() {
		//实例化数据库操作类
		$this->db = MySQLPDO::getInstance($GLOBALS['config']['db']);
	}
	/**
	 * 输入过滤
	 * @param $arr array 需要处理的字段
	 * @param $func callback 用于处理的函数
	 */
	protected function filter($arr,$func){
		foreach($arr as $v){
			//指定默认值
			if(!isset($_POST[$v])){
				$_POST[$v] = '';
			}
			//调用函数处理
			$_POST[$v] = $func($_POST[$v]);
		}
	}
}
