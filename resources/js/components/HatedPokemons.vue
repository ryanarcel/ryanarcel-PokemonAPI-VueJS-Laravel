<template>
  <div class="liked-pokemons">
    <h4 class="mb-5">Pokemons you Hated</h4>
    <div class="container">
    <table class="table table-hover liked-table shadow-lg">
      <thead>
        <tr class="text-center">
          <th>Pokemon ID</th>
          <th>Pokemon Name</th>
          <th>See Details</th>
        </tr>
      </thead>
      <tbody>
        <tr class="text-center" v-for="(pokemon, index) in this.likedPokemons" :key="index">
          <td>{{pokemon.pokemon_id}}</td>
          <td class="fw-bold" style="color:#107DB2">{{this.capitalize(pokemon.name)}}</td>
          <td><button class="btn btn-info" data-bs-toggle="modal" :data-bs-target="`#listdetailsModal-${pokemon.pokemon_id}`">More Details</button></td>

          <ListDetailsModal
            :id="`listdetailsModal-${pokemon.pokemon_id}`"
            :name="pokemon.name"
          />

        </tr>
      </tbody>
    </table>
    </div>
  </div>
</template>

<script>
import ListDetailsModal from './ListDetailsModal.vue'

export default {
  components:{
    ListDetailsModal
  },
  data(){
    return{
      user_id: 0,
      likedPokemons : [],
    }
  },
  methods:{

     fetchData() {

        axios.get("/api/pokemons/hates/"+this.user_id)
        .then((result)=>{
          const data = result.data;
          this.likedPokemons = data;
          console.log("Liked: ", this.likedPokemons);
        })
        .catch((error) => {
            console.log("There is a problem: ", error);
        });
    },

    capitalize(name) {
      let newname = name.replace(/^./, name[0].toUpperCase());
      return newname;
    }
  },

  mounted(){
    console.log(this.capitalize("ryan"));
    this.loggedInEmail = sessionStorage.getItem("email");
    this.user_id = sessionStorage.getItem("user_id");
    this.fetchData()

  }

};
</script>

<style scoped>
  .liked-pokemons{
    font-size: 20px;
  }
  .liked-table{
    background-color: rgb(255, 157, 157);
  }

</style>