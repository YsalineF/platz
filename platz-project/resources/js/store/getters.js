let getters = {

  /* ----------------------- RESSOURCES ----------------------- */
  // Retourne un certain nombre de ressources
  // Les éléments start et end sont définis dans les params dans le fichier Index.vue
  getRessources(state) {
    return function({start, end}) {
      // Inspiré de https://stackoverflow.com/questions/59327314/reactjs-array-slicestart-end-not-working
      let ressources = {...state.ressources.slice(start, end)}
      return ressources
    }
  },
  //Retourne la ressource en fonction de son id
  getRessourceById(state) {
    return function(id) {
      return state.ressources.find(ressource => ressource.id == id)
    }
  },
  // Retourne un certain nombre de ressources en fonction de l'élément categorie_id de la ressource
  getRessourcesByCategorieId(state) {
    return function(data) {
      let ressources = {...state.ressources.filter(ressource => ressource.categorie_id === data).slice(0,4)}
      return ressources
    }
  },

  /* ----------------------- CATEGORIES ----------------------- */
  // Retourne toutes les catégories
  getCategories(state) {
    return state.categories
  },
  // Retourne la catégorie en fonction de l'élément categorie_id de la ressource
  getCategoriesByRessourceId(state) {
    return function(data) {
      return state.categories.find(categorie => categorie.id === data.categorie_id)
    }
  },

  /* ----------------------- USERS ----------------------- */
  getUserByRessourceId(state) {
    return function(data) {
      return state.users.find(user => user.id === data.user_id)
    }
  },

  /* ---------------------- COMMENTAIRES ------------------*/
  getCommentaires(state){
    return state.commentaires;
  },

  getCommentaireById(state) {
    return function (id) {
      return state.commentaires.find(commentaire => commentaire.id == id);
    }
  },

  getCommentairesByRessourceId(state) {
    return function (id){
      return state.commentaires.filter(commentaires => commentaires.ressource.id == id);
  }
},

}

export default getters;
