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

    <router-link v-if="$store.state.connectedUser" to="/add">
      <button class="button-add" type="button" name="button">Add a resource</button>
    </router-link>
    <router-link v-if="$store.state.connectedUser && $route.name === 'show'" :to="`/edit/${ressourceId}`">
      <button class="button-edit" type="button" name="button">Edit resource</button>
    </router-link>
  </div>
</div>

</template>

<script>
export default {
  data() {
    return {
    }
  },
  computed: {
    categories() {
      // Retourne toutes les categories
      return this.$store.getters.getCategories;
    },
    // Retourne l'id de la ressource actuelle et permet d'avoir acces au bouton
    // pour accéder au formulaire d'edit de la ressource
    ressourceId() {
      let ressourceId = this.$route.params.id
      return ressourceId
    }

  }
}

</script>
<style lang="css" scoped>
.button-add, .button-edit {
  display: block;
  float: left;
  font-family: Helvetica, sans-serif;
  width: auto;
  height: auto;
  margin-top: 20px;
  border-radius: 5px;
}
.button-edit {
  margin-left: 10px;
}
</style>
