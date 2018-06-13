import axios from 'axios'
import qs from 'qs'
const state = {
  asc:[],
  desc:[],
  hot:[],
  bigCount:0,
  smallComments:[]
}

const getters = {
  asc(){
    return state.asc;
  },
  desc(){
    return state.desc;
  },
  hot(){
    return state.hot;
  },
  commentCount(){
    return state.bigCount;
  },
  smallComments(){
    return state.smallComments;
  }
}

const actions = {

}

const mutations = {
  getBigComment(state,obj){
    //判断是否利用缓存
    if(obj.cache || state[obj.order].length<=0){
      axios({
        method:'post',
        url:'./static/php/index.php?p=comment&c=comment&a=getBigComment',
        data:qs.stringify({
          mid:obj.mid,
          type:obj.type,
          order:obj.order,
          limit:state[obj.order].length>0?state[obj.order].length:0
        }),
        header:{'Content-Type':'application/x-www-form-urlencoded'}
      }).then((res)=>{
        var data = res.data;
        if(typeof data != 'object'){
          data = JSON.parse(data);
        }
        // console.log(data);
        // console.log(typeof data);
        if(obj.order === 'asc'){
          state.asc = state.asc.concat(data);
        }else if(obj.order === 'desc'){
          state.desc = state.desc.concat(data);
        }else if(obj.order === 'hot'){
          state.hot = state.hot.concat(data);
        }
      });
    }
  },
  bigCount(state,value){
    state.bigCount = value;
  },
  getSmallComment(state,bigId){
    console.log(bigId)
    axios({
      method:'post',
      url:'./static/php/index.php?p=comment&c=comment&a=getSmallComment',
      data:qs.stringify({
        'bigId':bigId
      }),
      header:{'Content-Type':'application/x-www-form-urlencoded'}
    }).then((res) =>  {
      var data = res.data;
      if(typeof data != 'object'){
        data = JSON.parse(data);
      }
      console.log(data);
      state.smallComments = data;
      console.log(state.smallComments);
    });
  }
}

export default {
  state,
  getters,
  actions,
  mutations
}
