<template lang="html">
  <div class="form">
    <h1>Platz - Register</h1>
    <form class="" action="#" @submit.prevent="login">
      <div class="form-input">
        Pseudo :
        <input type="text" name="name" placeholder="name" v-model="registerForm.name" required value="">
      </div>
      <div class="form-input">
        Email :
        <input type="text" name="email" placeholder="email" v-model="registerForm.email" required value="">
      </div>
      <div class="form-input">
        Password :
        <input type="password" name="password" placeholder="password" v-model="registerForm.password" required value="">
      </div>
      <button>Register</button>
    </form>
    <p>Already hava an account ?</p>
    <router-link to="/login">Sign in</router-link>
  </div>
</template>

<script>
export default {
  data() {
    return {
      // Initialise a vide les elements du formulaire
      registerForm: {
        name: '',
        email: '',
        password: ''
      }
    }
  },
  methods: {
    // Permet au user de se register
    login() {
      // Mise en place de cookie pour une certaine durée (ici: 1heure)
      axios.get('sanctum/csrf-cookie').then(response => {
        // Accede a la route pour s'enregister via les infos communiquees via le formulaire
        axios.post('api/auth/register', this.registerForm).then(response => {
          this.$store.dispatch('loginUser', response.data.user)
          // Transforme les data du user connecté en un objet JSON
          let connected = JSON.stringify(response.data.user)
          // Afin de le stocker dans le session storage (voir inspecteur > application > session storage)
          sessionStorage.setItem('connected', connected)
          // renvoie vers la route "index" donc vers la page d'accueil
          this.$router.push({name: "index"})
        })
      })
    }
  }
}
</script>

<style lang="css" scoped>
  .form {
    display: flex;
    flex-wrap: wrap;
    flex-direction: column;
    justify-content: center;
    text-align: center;
    font-family: Helvetica, sans-serif;
  }
  .form-input {
    padding-bottom: 15px;
  }
</style>
