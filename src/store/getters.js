import state from './state';
const getters = {
	showMinimize(){
		return state.showMinimize
	},
	menuShow(){
		return state.menuShow;
	},
	audioInfo(){
		var audioInfo = state.audioInfo;
		if(audioInfo.length != 0){
			return audioInfo;
		}
		return [{img:'',src:'',name:'',singer:'',lyric:''}];
	},
	audioMid(){
		return state.audioMid;
	},
	musicIndex2(){
		return state.musicIndex2;
	},

	checkLogin(){
		return state.checkLogin;
	}
}

export default getters;
