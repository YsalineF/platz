<template>
  <div class="edit-page" v-if="$store.state.connectedUser">
    <h2>Platz</h2>
    <h3>Edit resource</h3>

    <form action="#" @submit.prevent="editRessource">
      <div class="form-element">
        Name
        <input type="text" name="nom" placeholder="name" v-model="editForm.nom" required >
      </div>
      <div class="form-element">
        Description
        <textarea name="name" rows="8" cols="80" placeholder="description" v-model="editForm.description" required></textarea>
      </div>
      <div class="form-element">
        Image
        <input type="file" @change="imageChange" name="image" value="" required>
        <img :src="`assets/img/${ressource.image}`" v-if="!imagePreview" />
        <img v-bind:src="imagePreview" width="100" height="100" v-show="showPreview"/>
      </div>
      <div class="form-element">
        Categorie
        <select class="" v-model="editForm.categorie" name="" required>
          <option value="">Categorie</option>
          <option v-for="categorie in categories" :key="categorie.id" :value="categorie.id">{{ categorie.nom }}</option>
        </select>
      </div>
      <div class="form-element">
        Size
        <input type="number" name="Size" placeholder="size" v-model="ressource.size" value="">
      </div>
      <button>Save changes</button>
    </form>

  </div>
</template>

<script>
export default {
  name: 'Edit',
  data() {
    return {
      // Instancie le tableau editForm avec des éléments null
      editForm: {
        id: null,
        name: '',
        description: '',
        image: '',
        categorie: '',
        user: ''
      },
      imagePreview: null,
      showPreview: false,
    }
  },
  computed: {
    categories() {
      // Return les ressources correspondants à la resource demandée
      return this.$store.getters.getCategories
    },
    ressource() {
      // Récupère l'id de la ressource qui se trouve dans l'url
      let id = this.$route.params.id
      return this.$store.getters.getRessourceById(id)
    },
    categorie() {
      return function(ressource) {
        // Retourne la categorie qui correspond à la ressource actuelle
        return this.$store.getters.getCategoriesByRessourceId(ressource)
      }
    }
  },
  methods: {
    // Inspiration https://www.youtube.com/watch?v=VqnJwh6E9ak
    imageChange(event){
      this.editForm.image = event.target.files[0];

      let reader  = new FileReader();
      reader.addEventListener("load", function () {
        this.showPreview = true;
        this.imagePreview = reader.result;
      }.bind(this), false);
      if( this.editForm.image ){
        if ( /\.(jpeg|png|gif)$/i.test( this.editForm.image.name ) ) {
          reader.readAsDataURL( this.editForm.image );
        }
      }
    },
    // Permet d'editer la ressource choisie
    // On instancie un objet FormData qu'on rempli avec les éléments actuels de la ressource (voir created())
    editRessource() {
      this.editForm.user = this.$store.state.connectedUser.id
      let editForm = new FormData();
      editForm.append("id", this.editForm.id);
      editForm.append("image", this.editForm.image);
      editForm.append("nom", this.editForm.nom);
      editForm.append("description", this.editForm.description);
      editForm.append("categorie", this.editForm.categorie);
      editForm.append("user", this.editForm.user);
      axios.post('api/edit', editForm)
      this.$router.push("/")
    }
  },
  // Rempli le tableau "editForm" avec les éléments actuels de la ressource au chargement de la page
  created() {
    this.editForm.nom = this.ressource.nom
    this.editForm.description = this.ressource.description
    this.editForm.categorie = this.ressource.categorie_id
    this.editForm.id = this.$route.params.id
    this.editForm.image = this.ressource.image
  }

}
</script>

<style lang="css" scoped>
.edit-page {
  display: block;
  justify-content: center;
  text-align: center;
  font-family: Helvetica, sans-serif;
}
.form-element {
  margin-bottom: 10px;
  vertical-align: center;
}
</style>
