<template>
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-md-8">
        <div class="alert alert-danger" role="alert" v-if="error !== null">
          {{ error }}
        </div>

        <div class="card col-md-8 offset-md-2">
          <div class="card-header bg-info text-white">Login</div>
          <div class="card-body">
            <form>
              <div class="form-group row mb-2">
                <label for="email" class="col-sm-4 col-form-label text-md-right"
                  >E-Mail Address</label
                >
                <div class="col-md-6">
                  <input
                    id="email"
                    type="email"
                    class="form-control"
                    v-model="this.email"
                    required
                    autofocus
                    autocomplete="off"
                  />
                </div>
              </div>

              <div class="form-group row mb-2">
                <label
                  for="password"
                  class="col-md-4 col-form-label text-md-right"
                  >Password</label
                >
                <div class="col-md-6">
                  <input
                    id="password"
                    type="password"
                    class="form-control"
                    v-model="this.password"
                    required
                    autocomplete="off"
                  />
                </div>
              </div>

              <div class="form-group row mb-0">
                <div class="col-md-8 offset-md-4">
                  <button
                    type="submit"
                    class="btn btn-primary"
                    @click="handleSubmit"
                  >
                    Login
                  </button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      email: "",
      password: "",
      error: null,
    };
  },
  methods: {
    handleSubmit(e) {
      e.preventDefault();
      if (this.password.length > 0) {
        axios.get("/sanctum/csrf-cookie").then((response) => {
          axios.post("api/login", {
              email: this.email,
              password: this.password,
            })
            .then((response) => {
              console.log("login response: ",response.data);
              if (response.data.success) {
                sessionStorage.setItem("email", this.email);
                sessionStorage.setItem("user_id", response.data.user_id);
                this.$router.push({name: 'Dashboard'});
              } else {
                this.error = response.data.message;
              }
            })
            .catch(function (error) {
              console.error("Error: ", error);
             // this.error = "Something is wrong";
            });
        });
      }
    },
  },

  mounted(){
    this.loggedInEmail = sessionStorage.getItem("email");
    console.log("session email: ", sessionStorage.getItem("email"));

    // if(this.loggedInEmail!=""){
    //   this.$router.push({name: 'Dashboard'})
    // }
  }
};
</script>