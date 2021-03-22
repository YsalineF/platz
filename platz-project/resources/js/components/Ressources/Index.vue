<template>
  <div>
    <div class="container object">
      <div id="main-container-image">
        <section class="work" v-for="ressource in ressources" :key="ressource.id">

          <figure class="white">
            <router-link :to="{name: 'show', params: { id: ressource.id }}">
              <img :src="`assets/img/${ressource.image}`" :alt="ressource.nom" />
              <dl>
                <dt>{{ ressource.nom }}</dt>
                <dd>{{ ressource.description }}</dd>
              </dl>
            </router-link>
            <div id="wrapper-part-info">
              <div class="part-info-image">
                <img :src="`assets/img/${categories(ressource).icone}`" :alt="categories(ressource).nom" width="28" height="28"/>
              </div>
              <div id="part-info">{{ categories(ressource).nom }}</div>
            </div>
          </figure>

        </section>

      </div>
    </div>

    <div id="wrapper-oldnew">
      <div class="oldnew">
        <div class="wrapper-oldnew-prev">
          <div id="oldnew-prev" @click="previousRessources"></div>
        </div>
        <div class="wrapper-oldnew-next">
          <div id="oldnew-next" @click="moreRessources"></div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      params: {
        start: 0,
        end: 20,
        more: 20
      }
    }
  },
  computed: {
    ressources() {
      let idCat = this.$route.params.id;

      if (typeof idCat !== 'undefined'){
        return this.$store.getters.getRessourcesByCategorieId(this.$route.params.id);
      }

      // Retourne un certain nombre de ressources (le nombre dépend des params)
      return this.$store.getters.getRessources(this.params)
    },
    categories() {
      return function(ressource) {
        // Retourne la catégorie de la ressource choisie
        return this.$store.getters.getCategoriesByRessourceId(ressource)
      }
    },
  },
  methods: {
    // Permet de charger plus de ressources (nombre defini via l'element "more" des params)
    moreRessources() {
      // On verifie si l'element "end" des params est plus grand/égal au nombre de ressources dans la db
      // si c'est le cas, on "réinitialise" le params "start" à 20 et le params "end" avec le nombre de ressources dans la db
      if(this.params.end >= this.$store.state.ressources.length) {
        this.params.start = 20
        this.params.end = this.$store.state.ressources.length
        console.log("if : " +this.params.start)
        console.log("if : " + this.params.end)
        console.log((this.$store.state.ressources.length + 1))
        // Appel de la methode scrollToTop().
        // Si on ne l'utilise pas, on reste en bas de la fenetre
        this.scrollToTop()
      }
      // Si l'element "end" des params est plus petit que le nombre de ressources dans la db
      // On ajoute aux params "start" et "end", le params "more"
      else {
        this.params.start += this.params.more
        this.params.end += this.params.more
        this.scrollToTop()
      }
    },
    // Permet de charger les ressources précédentes (ex: les 20 dernières) si on a chargé les 20 suivantes
    previousRessources() {
      // On verifie si l'element "start" des params est different de 0
      // si c'est le cas, on retire l'element "more" aux elements "start" et "end" des params
      if(this.params.start !== 0) {
        this.params.start -= this.params.more
        this.params.start -= this.params.more
        // Appel de la methode scrollToTop(), si on ne l'utilise pas, on reste en bas de la fenetre
        this.scrollToTop()
      }
    },
    // Permet de scroll au top de la fenetre quand on charge plus/moins de ressources
    scrollToTop() {
      // Inspiration https://stackoverflow.com/questions/50449123/vue-js-scroll-to-top-of-page-for-same-route
      window.scrollTo(0,0)
    }
  }
}
</script>

<style lang="css" scoped>
</style>
