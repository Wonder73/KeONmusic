import Vue from 'vue';
import Vuex from 'vuex';

import state from './state.js';
import getters from './getters.js';
import actions from './actions.js';
import mutations from './mutations.js';

import detail from './detail/detail.js'
import comment from './comment/comment.js'

Vue.use(Vuex);

export default new Vuex.Store({
	state,
	getters,
	actions,
	mutations,
	modules:{
		detail,
		comment
	}
})
