<template>
 <div class="modal fade" :id="`${id}`" tabindex="-1" aria-hidden="true">
   <div class="modal-dialog modal-lg">
     <div class="modal-content ">
       <div class="modal-header">
         <h5 class="modal-title fw-bold" >{{name.toUpperCase()}}</h5>
         <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
       </div>
       <div class="modal-body p-5">
         <div class="container">
          <div class="row">
            <div class="col">
            <table class="details-table ">
              <tr>
                <td class="fw-bold category">Type</td>
                <td class="fw-bold">:</td>
                <td class="values">{{this.thisPokemon.type }}</td>
              </tr>
              <tr>
                <td class="fw-bold category">Height</td>
                <td class="fw-bold">:</td>
                <td class="values">{{this.thisPokemon.height * 10}}cm</td>
              </tr>
              <tr>
                <td class="fw-bold category">Weight</td>
                <td class="fw-bold">:</td>
                <td class="values">{{this.thisPokemon.weight * 0.1}} kg</td>
              </tr>
              <tr>
                <td class="category">
                    <h6 class=""><b>Abilities</b></h6>
                </td>
                <td class="fw-bold">:</td>
                <td class="values">
                    <ul class="pl-5">
                      <li v-for="(ability, index) in this.thisPokemon.abilities" :key="index">
                        <span class="ability ">{{ability}}</span>
                      </li>
                    </ul>
                </td>
              </tr>
            </table>
            </div> <!--end first col-->

            <div class="col">
              <img :src="this.thisPokemon.imageLink" alt="">
            </div>

         </div>
        </div>
       </div>
       <div class="modal-footer">
         <button type="button" class="btn btn-success" data-bs-dismiss="modal">Okay</button>

       </div>
     </div>
   </div>
 </div>
</template>

<script>

export default {

  props:{
    id: "",
    name: "",
  },

  data(){
   return{
     thisPokemon:{
      pokemon_id : 0,
      type: "",
      name: "",
      imageLink : "",
      height: "",
      weight: "",
      abilities: []
     }
   }
  },

 methods:{
   fetchIndivData() {
       axios.get(`https://pokeapi.co/api/v2/pokemon/${this.name}`)
      .then(result => {
          const data = result.data;
          this.setData(data);
          console.log(data);
      }).catch((err) => {
        console.log("Error ",err);
      });
    },

    setData(data) {
      this.thisPokemon.pokemon_id = data.id;
      this.thisPokemon.type = data.types[0].type.name;
      this.thisPokemon.name = data.name;
      this.thisPokemon.imageLink = data.sprites.other.dream_world.front_default;
      this.thisPokemon.height = data.height;
      this.thisPokemon.weight = data.weight;
      data.abilities.forEach((ability) => {
        this.thisPokemon.abilities = [...this.thisPokemon.abilities, ability.ability.name];
      });
    },

 },

  created(){
   // console.log(this.abilities);
   this.fetchIndivData();
  }

}
</script>
<style scoped>
  .modal-body{
    padding-left: auto;
    padding-right: auto;
  }
  table{
    margin-left: auto;
    margin-right: auto;
    font-size: 16px;

  }
  .category{
   text-align: right;
   padding-right: 10px;
  }
  .values{
   text-align: left;
   padding-left: 10px;
  }
    img{
    height: 200px;
    width:200px;
  }


</style>
