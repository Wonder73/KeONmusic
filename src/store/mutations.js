import axios from 'axios';
import qs from 'qs';
const mutations = {
  setShowMinimize(state,flag){       //更新迷你菜单 的显示
    state.showMinimize = flag;
  },
  setMenuShow(state,flag){       //更新菜单的显示
    state.menuShow = flag;
  },
  updateMenuInfo(state,value){
    state.menuInfo = value;
  },
  getMusicUrl(state,obj){
    if(state.audioMid.indexOf(obj.singleMid) >= 0){
      state.musicIndex2 = state.audioMid.indexOf(obj.singleMid);
      return;
    }
    $.ajax({
        async: true,
        url: "https://c.y.qq.com/base/fcgi-bin/fcg_music_express_mobile3.fcg?g_tk=5381&jsonpCallback=MusicJsonCallback15934699247894013&loginUin=0&hostUin=0&format=json&inCharset=utf8&outCharset=utf-8&notice=0&platform=yqq&needNewCode=0&cid=205361747&uin=0&guid=984497069",
        type: "GET",
        dataType: 'jsonp',
        jsonp: 'callback',
       data: {
        songmid:obj.singleMid,
        filename:'C400'+obj.meidaMid+'.m4a'
      },
        timeout: 5000,
        success: (json) => {
          var filename = json.data.items[0].filename;
					var vkey = json.data.items[0].vkey;
          var src = '';
					if(vkey){       //判断可不可以获取歌曲，不能返回false
						src ='http://dl.stream.qqmusic.qq.com/'+filename+'?vkey='+vkey+'&guid=984497069&uin=0&fromtag=66';
          }else{
						src=false;
					}
          $.ajax({
            async:true,
            url:"./static/php/lyric.php?songmid="+obj.singleMid,
            type:"GET",
            success:(res)=>{
              // console.log(res);
              state.audioInfo.push({
                img:obj.img,
                name:obj.single,
                singer:obj.singer,
                src,
                lyric:res
              });
              state.audioMid.push(obj.singleMid);
              state.musicIndex2 = state.audioInfo.length-1;
              localStorage.setItem('musicInfo',JSON.stringify(state.audioInfo));
              localStorage.setItem('audioMid',JSON.stringify(state.audioMid));

            }
          })

        },error: function (xhr) {

        }
    });
  },
  localAudio(state){
    state.audioInfo = JSON.parse(localStorage.getItem('musicInfo'))?JSON.parse(localStorage.getItem('musicInfo')):[];
    state.audioMid = JSON.parse(localStorage.getItem('audioMid'))?JSON.parse(localStorage.getItem('audioMid')):[];
  },
  //验证用户登录成功
  checkLogin(state){
    var username = localStorage.getItem('username');
    var password = localStorage.getItem('password');
    var userId = localStorage.getItem('userId');
    axios({
      method:'post',
      url:'./static/php/index.php?p=login&c=login&a=checkLogin',
      data:qs.stringify({'userId':userId,'username':username,'password':password}),
      headers:{'Content-Type':'application/x-www-form-urlencoded'}
    }).then((res)=>{
      var data = res.data;
      if(data === '有效'){
        state.checkLogin = true;
      }else{
        state.checkLogin = false;
      }
    });
  }
}

export default mutations;
