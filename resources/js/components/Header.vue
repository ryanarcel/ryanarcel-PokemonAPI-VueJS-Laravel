<template>
  <nav class="navbar navbar-expand-lg navbar-light bg-info fixed-top">
    <div class="container">
      <a class="navbar-brand" href="#"><img class="logo-banner" src="http://localhost:8000/image/pokemon-logo.png" alt=""></a>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav menu col-md-3">
          <li class="nav-item">
            <router-link to="/pokemons" class="nav-link text-white">Pokemons</router-link>
          </li>
          <li class="nav-item">
            <router-link to="/account-view" class="nav-link text-white">Account</router-link>
          </li>
        </ul>

        <ul class="navbar-nav menu col-md-2 offset-md-7 ">
          <li class="nav-item">
              <a href="#" class="nav-link text-white">Likes</a>
          </li>
          <li class="nav-item">
              <a href="#" class="nav-link text-white">Hates</a>
          </li>
           <a class="nav-item nav-link text-white" style="cursor: pointer;" @click="this.logout">Logout</a>
        </ul>
      </div>
    </div>
  </nav>
</template>
<script>
export default {
  methods: {
     logout(e) {
            e.preventDefault()
            axios.get('/sanctum/csrf-cookie').then(response => {
                axios.post('/api/logout')
                    .then(response => {
                        if (response.data.success) {
                            window.location.href = "/"
                        } else {
                            console.log("Response: ",response)
                        }
                    })
                    .catch(function (error) {
                        console.error(error);
                    });
            })
      }
  }
};
</script>

<style scoped>
	.menu{
		position: relative;
		float: right;
	}
  .logo-banner{
    height: 30px;
    width: 70px;
  }
</style>