<!-- NAVBAR -->
<template>

  <div id="main-container-menu" class="object" @click="menuVisible" v-bind:class="[menu ? 'menu-hidden' : 'menu-visible']">
      <div class="container-menu">

            <div id="main-cross">
              <div id="cross-menu"></div>
            </div>

            <div id="main-small-logo">
              <div class="small-logo"></div>
            </div>

            <router-link :to="{name: 'index'}">
              <div id="main-premium-ressource">
                  <div class="premium-ressource"><a href="#">No filter</a></div>
              </div>
            </router-link>

              <div v-for="categorie in categories" :key="categorie.id">
                <router-link id="main-ai" :to="{ name: 'categories.show', params: { id: categorie.id } }">
                  <div class="ai">
                    <a href="#">{{ categorie.nom }}</a>
                  </div>
                </router-link>
              </div>

        </div>
    </div>

</template>

<script>
export default {
  data() {
    return {
      menu : 'menu-hidden'
    }
  },
  computed: {
    categories() {
      return this.$store.getters.getCategories
    }
  },
  methods: {
    menuVisible() {
      this.menu = !this.menu;
    }
  }
}

</script>
<style lang="css" scoped>
  #main-container-image {
      float:left;
      width:100%;
      height:auto;
    	background-color:#F4F4F4;
    	margin-top:25px;
    	opacity:1;
  }
  .menu-visible {
    left: 0;
    z-index: 10000 !important;
  }
  .menu-hidden {
    left: -100%;
    z-index: 10000 !important;
  }

</style>
