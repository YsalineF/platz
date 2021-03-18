// ./router.js

import Vue from 'vue'
import Router from 'vue-router'

// Chargement des composants des différentes routes
import RessourcesIndex from './components/ressources/Index'
import RessourceShow from './components/ressources/Show'


// Création du routing
Vue.use(Router)
export default new Router({
  routes: [
    {
      path: '/',
      name: 'index',
      component: RessourcesIndex
    },
    {
      path: '/ressources/:id',
      name: 'show',
      component: RessourceShow
    },
    {
      path: '/ressources/categories/:id',
      name: 'categories.show',
      component: RessourcesIndex
    }
  ]
})
