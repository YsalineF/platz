<!-- NAVBAR -->
<template>

<div id="wrapper-navbar">
  <div class="navbar object">

    <div id="wrapper-bouton-icon" v-for="categorie in categories" :key="categorie.id">
      <router-link :to="{name: 'categories.show', params: { id: categorie.id }}">
        <div id="bouton-theme">
          <img :src="'assets/img/' + categorie.icone" alt="" title="" height="28" width="28">
        </div>
      </router-link>
    </div>
    <router-link id="wrapper-bouton-icon" :to="{name: 'index'}">
      <div id="bouton-premium">
          <img :src="'assets/img/icon-premium.svg'" alt="no filter" title="No Filter" height="38" width="90">
      </div>
    </router-link>
  </div>
</div>

</template>

<script>
export default {
  computed: {
      categories() {
      return this.$store.getters.getCategories;
    }
  }
}

</script>
<style lang="css" scoped>
</style>
