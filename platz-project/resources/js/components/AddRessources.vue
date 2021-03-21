<template>
  <div v-if="$store.state.connectedUser">
    <h2>Platz</h2>
    <h3>Add a resource</h3>

    <form class="form-add" action="#" @submit.prevent="addResource">
      <div class="">
        Name
        <input type="text" name="nom" placeholder="name" v-model="addForm.nom" value="">
      </div>
      <div class="">
        Description
        <textarea name="name" rows="8" cols="80" placeholder="description" v-model="addForm.description"></textarea>
      </div>
      <div class="">
        Image
        <input type="file" @change="imageChange" name="image" value="">
        <img v-bind:src="imagePreview" width="100" height="100" v-show="showPreview"/>
      </div>
      <div>
        Categorie
        <select class="" v-model="addForm.categorie" name="">
          <option value="">Categorie</option>
          <option v-for="categorie in categories" :key="categorie.id" :value="categorie.id">{{ categorie.nom }}</option>
        </select>
      </div>
      <div class="">
        Size
        <input type="number" name="Size" placeholder="size" v-model="addForm.size" value="">
      </div>
      <button>Add resource</button>
    </form>
  </div>
</template>

<script>

export default {
        name: 'Add',
        data() {
            return {
                addForm: {
                    nom: '',
                    description: '',
                    image: '',
                    categorie: '',
                    user: '',
                    size: 0
                },
                imagePreview: null,
                showPreview: false,
            }
        },
        computed: {
            categories() {
                // Return les ressources correspondants à la resource demandée
                return this.$store.getters.getCategories
            }
        },
        methods: {
          // Inspiration https://www.youtube.com/watch?v=VqnJwh6E9ak
          imageChange(event){
                this.addForm.image = event.target.files[0];

                  let reader  = new FileReader();
                  reader.addEventListener("load", function () {
                      this.showPreview = true;
                      this.imagePreview = reader.result;
                  }.bind(this), false);
                  if( this.addForm.image ){
                      if ( /\.(jpeg|png|gif|jpg)$/i.test( this.addForm.image.name ) ) {
                          reader.readAsDataURL( this.addForm.image );
                          // console.log(reader.readAsDataURL( this.addForm.image ))
                      }
                  }
            },
            addResource(){
              this.addForm.user = this.$store.state.connectedUser.id;

              // Inspiration : https://stackoverflow.com/questions/49587831/how-to-append-files-and-data-to-formdata-in-vue-js
              let addForm = new FormData();
              addForm.append("image", this.addForm.image);
              addForm.append("nom", this.addForm.nom);
              addForm.append("description", this.addForm.description);
              addForm.append("categorie", this.addForm.categorie);
              addForm.append("user", this.addForm.user);
              addForm.append("size", this.addForm.size);

              axios.post('api/add', addForm)
              this.$router.push("/")
            },
        }
    }

// export default {
//   data() {
//     return {
//       addForm: {
//         nom: '',
//         description: '',
//         categorie: '',
//         user: '',
//         image: ''
//       },
//       imagePreview: null,
//       showPreview: false
//     }
//   },
//   computed: {
//     categories() {
//       // Return toutes les categories
//       return this.$store.getters.getCategories;
//     }
//   },
//   methods: {
//     addResource() {
//       this.addForm.user = this.$store.state.connectedUser.id
//
//       let addForm = new addForm();
//       addForm.append("nom", this.addForm.nom);
//       addForm.append("description", this.addForm.description);
//       addForm.append("image", this.addForm.image);
//       addForm.append("categorie", this.addForm.categorie);
//       addForm.append("user", this.addForm.user);
//
//
//       axios.post('api/add', this.addForm)
//             .then(response => {
//               // Si tout c'est bien passé
//               this.$notify({
//                 text: "resource added"
//               })
//             })
//             .catch(() => {
//               // En cas de problème
//               this.$notify({
//                 text: "error while adding"
//               })
//             })
//       this.router.push('index')
//     },
//     imageChange(event) {
//       console.log(event.target.files[0].name)
//       this.addForm.image = event.target.files[0];
//       // // Inspiration pour reader : https://stackoverflow.com/questions/48494033/vuejs-filereader
//       let reader = new FileReader();
//       reader.addEventListener("load", function() {
//         this.showPreview = true;
//         this.imagePreview = reader.result;
//         // bind(this) permet de rendre this accessible à l'exterieur de la methode
//       }.bind(this), false);
//       //
//       //
//       console.log("Ligne 88 :" + this.addForm.image)
//       if(this.addForm.image) {
//         if ( /\.(jpeg|png|gif)$/i.test( this.addForm.image.name ) ) {
//           reader.readAsDataURL(this.addForm.image);
//           console.log("Ligne 92 :" + this.addForm.image)
//         }
//       }
//     },
//     fileChange(event) {
//       if(file === "") {
//         return false;
//       }
//       this.addForm.file = file.target.files
//       console.log(this.form.file)
//     }
//   }
// }
</script>

<style lang="css" scoped>
</style>
