<template>
  <div>
    <template v-if="$store.state.connectedUser">
      <button class="button-logout" type="button" name="button" @click="logout">
       Logout
     </button>
    </template>
    <template v-else>
     <button class="button-login" type="button" name="login">
       <router-link to="/login">Login</router-link>
     </button>
    </template>
    <template v-if="!$store.state.connectedUser">
     <button class="button-register" type="button" name="register">
       <router-link to="/register">Register</router-link>
     </button>
    </template>
  </div>
</template>


<script>
export default {
  methods: {
    // Permet au user de se deconnecter
    logout() {
      axios.post('api/logout', {user: this.$store.state.connectedUser})
            .then(response => {
              this.$store.dispatch('logoutUser', response.data)
            })
    }
  }
}
</script>

<style lang="css" scoped>
.button-logout {
  margin-right: 65px;
  cursor: pointer;
}
.button-login, .button-register, .button-logout {
  display: block;
  font-family: Helvetica, sans-serif;
  float: right;
  width: 10%;
  height: 30px;
  font-size: 1rem;
  margin-top: 15px;
  border: none;
  border-radius: 5px;
}
.button-login {
  margin-right: 65px;
}
.button-register {
  margin-right: 10px;
}


</style>
