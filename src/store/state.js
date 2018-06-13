const state = {
	showMinimize:false,   //迷你菜单的显示
	menuShow:false,       //菜单的显示
	menuInfo:[            //菜单的内容
		{'icon':'fa-commenting','name':'我的消息','count':'99未读'},
		{'icon':'fa-user-circle-o','name':'我的主页','count':'99%'},
		{'icon':'fa-headphones','name':'我的收藏','count':'888首'},
		{'icon':'fa-cloud-upload','name':'我的发布','count':'136首'},
		{'icon':'fa-heart','name':'我的关注','count':'136人'},
		{'icon':'fa-star','name':'我的好友','count':'136人'},
		{'icon':'fa-address-book-o','name':'我的好友','count':'500人'},
		{'icon':'fa-cog','name':'设置','count':''},
	],
	audioInfo:[],     //音乐信息
	audioMid:[],
	musicIndex2:0,
	checkLogin:false,   //是否登录成功
}

export default state;
