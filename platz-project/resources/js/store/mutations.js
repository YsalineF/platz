let mutations = {
  SET_RESSOURCES(state, data) {
    // Inspiration : https://stackoverflow.com/questions/42225073/how-to-sort-an-array-by-date-using-vue-js-2
    data.sort((a,b) => new Date(b.created_at) - new Date(a.created_at))
    state.ressources = data;
  },
  SET_CATEGORIES(state, data) {
    state.categories = data;
  },
  SET_USERS(state, data) {
    state.users = data;
  },
  SET_COMMENTAIRES(state, data) {
    state.commentaires = data;
  },
  LOGIN_USER(state, data) {
    state.connectedUser = data;
  },
  LOGOUT_USER(state) {
    state.connectedUser = null;
  },
  ADD_COMMENT(state, data) {
    state.commentaires.push(data);
  }
}

export default mutations;
