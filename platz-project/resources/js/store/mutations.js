let mutations = {
  SET_RESSOURCES(state, data) {
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
  }
}

export default mutations;
