let actions = {
  setRessources({commit}) {
    // Transaction AJAX
    axios.get('api/ressources')
          .then(responsePHP => commit('SET_RESSOURCES', responsePHP.data))
  },
  setCategories({commit}) {
    // Transaction AJAX
    axios.get('api/categories')
          .then(responsePHP => commit('SET_CATEGORIES', responsePHP.data))
  },
  setUsers({commit}) {
    // Transaction AJAX
    axios.get('api/users')
          .then(responsePHP => commit('SET_USERS', responsePHP.data))
  },
  setCommentaires({commit}) {
    // Transaction AJAX
    axios.get('api/commentaires')
          .then(responsePHP => commit('SET_COMMENTAIRES', responsePHP.data))
  },
  loginUser({commit}, data) {
    commit('LOGIN_USER', data)
  },
  logoutUser({commit}) {
    commit('LOGOUT_USER')
  },
  addComment({commit}, data) {
    commit('ADD_COMMENT', data)
  }
}

export default actions;
