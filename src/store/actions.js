const actions = {
  setShowMinimize({commit,state},flag){
    commit('setShowMinimize',flag);
  },
  setMenuShow({commit,state},flag){
    commit('setMenuShow',flag);
  }
}

export default actions;
