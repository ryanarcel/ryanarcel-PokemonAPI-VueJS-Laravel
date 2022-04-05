<template>
  <div>
    <img src="http:\\localhost:8000\image\pokeball.png" alt="" /><br />
    <h1>Welcome</h1>
  </div>
</template>

<script>
export default {
  name: "Home",
  data() {
    return {
      isLoggedIn: false
    };
  },

  methods: {
    checkIfLoggedIn() {
      let sessionEmail = sessionStorage.setItem("email", this.email);
      let sessionuserId = sessionStorage.setItem("user_id", response.data.user_id
      );
      if (sessionEmail && sessionuserId) {
        this.isLoggedIn = true;
        this.$router.push({ name: "Dashboard" });
      } else {
        this.isLoggedIn = false;
        this.$router.push({ name: "Home" });
      }


    },
  },
  mounted() {},
  created() {
    this.checkIfLoggedIn;
  },
};
</script>
<style scoped>
div {
  padding-left: auto;
  padding-right: auto;
  align-content: center;
}
img,
h1 {
  display: block;
  margin: auto;
  height: 300px;
  width: 300px;
}
h1 {
  text-align: center;
}
img:hover {
  height: 310px;
  width: 310px;
}
</style>