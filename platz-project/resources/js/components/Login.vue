<template lang="html">
  <div class="form">
    <h1>Platz - Login</h1>
    <form class="" action="#" @submit.prevent="login">
      <div class="form-input">
        Email :
        <input type="text" name="email" placeholder="email" v-model="loginForm.email" />
      </div>
      <div class="form-input">
        Password :
        <input type="password" name="password" placeholder="password" v-model="loginForm.password">
      </div>
      <button>Login</button>
    </form>
    <p>Don't have an account ?</p>
    <router-link to="/register">Register</router-link>
  </div>
</template>

<script>
export default {
  data() {
    return {
      // Initialise a vide les elements du formulaire
      loginForm: {
        email: '',
        password: ''
      }
    }
  },
  methods: {
    // Permet au user de se connecter
    login() {
      // Mise en place de cookie pour une certaine durée (ici: 1heure)
      axios.get('sanctum/csrf-cookie').then(response => {
        // Accede a la route pour se connecter via les infos communiquees via le formulaire
        axios.post('api/auth/login', this.loginForm).then(response => {
          this.$store.dispatch('loginUser', response.data)
          // mise en place d'un item "connected" dans le local storage
          localStorage.connected = 'true'
          // renvoie vers la route "index" donc vers la page d'accueil
          this.$router.push({name: 'index'})
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
