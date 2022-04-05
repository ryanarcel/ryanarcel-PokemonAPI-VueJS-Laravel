<template>
    <div class="container">

        <nav class="navbar navbar-expand-lg navbar-light bg-info fixed-top">
            <div class="container">
            <a class="navbar-brand" href="#"><img class="logo-banner" src="http://localhost:8000/image/pokemon-logo.png" alt=""></a>
            <div class="collapse navbar-collapse">
                <!-- for non-logged user-->

                <div class="navbar-nav col-md-2" v-if="!this.isLoggedIn">
                    <router-link to="/login" class="nav-item nav-link text-white">Login</router-link>
                    <router-link to="/register" class="nav-item nav-link text-white">Register</router-link>

                </div>
                <!-- for logged-in user-->
                <div class="navbar-nav col-md-7 offset-md-5" v-else>
                    <router-link to="/dashboard" class="nav-item nav-link text-white">Pokemons</router-link>
                    <router-link to="/account-view" class="nav-item nav-link text-white">Account</router-link>
                    <router-link to="/liked-pokemons" class="nav-item nav-link text-white">My Likes</router-link>
                    <router-link to="/hated-pokemons" class="nav-item nav-link text-white">My Hates</router-link>
                     <router-link to="/other-users" class="nav-item nav-link text-white">Other Users</router-link>
                    <a class="nav-item nav-link text-danger" style="cursor: pointer;" @click="this.logout">Logout</a>
                </div>
            </div>
            </div>
        </nav>
        <br/>
        <router-view/>
    </div>
</template>

<script>
export default {
    name: "App",
    data() {
        return {
            isLoggedIn: false,
        }
    },
    methods: {
        logout(e) {
            e.preventDefault()
            axios.get('/sanctum/csrf-cookie').then(response => {
                axios.post('/api/logout')
                    .then(response => {
                        if (response.data.success) {
                            sessionStorage.clear();
                            this.isLoggedIn = false;
                            this.$router.push({name: 'Home'});
                        } else {
                            console.log(response)
                        }
                    })
                    .catch(function (error) {
                        console.error(error);
                    });
            })
        },

        checkIfLoggedIn(){


        }
    },

    created() {

        let sessionEmail = sessionStorage.getItem("email");
        let sessionuserId = sessionStorage.getItem("user_id");

        if(sessionEmail && sessionuserId){
            this.isLoggedIn = true;
            this.$router.push({name: 'Dashboard'});
        }
        else{
            this.isLoggedIn = false;
            this.$router.push({name: 'Home'});
        }

        console.log("Session email: ", sessionEmail);
        console.log("Is logged in: ", this.isLoggedIn);

    },
}
</script>
<style scoped>
  .logo-banner{
    height: 30px;
    width: 70px;
  }
</style>