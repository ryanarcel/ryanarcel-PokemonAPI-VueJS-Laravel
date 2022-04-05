<template>
  <h4>Other users</h4>
   <table class="table table-hover shadow-lg">
      <thead>
        <tr class="text-center">
          <th>User ID</th>
          <th>Email</th>
          <th>Likes</th>
          <th>Hates</th>
        </tr>
      </thead>
      <tbody>
        <tr class="text-center" v-for="(user, index) in this.users" :key="index">

          <td>{{user.id}}</td>
          <td class="text-success fw-bold">{{user.email}}</td>
          <td>
          <button
          	class="btn btn-primary"
						data-bs-toggle="modal"
						:data-bs-target="`#likesModal-${user.id}`"
						@click="fetchLikedPokemonData(user.id)">
								Liked Pokemons
					</button>
          </td>
          <td>
            <button
          	class="btn btn-danger"
						data-bs-toggle="modal"
						:data-bs-target="`#hatesModal-${user.id}`"
						@click="fetchHatedPokemonData(user.id)">
								Hated Pokemons
						</button>
          </td>

           <!-- likes modal -->
           <div class="modal fade" :id="`likesModal-${user.id}`" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header bg-primary">
                  <h5 class="modal-title text-white" id="exampleModalLabel">Liked Pokemons by {{user.email}}</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                  <ul v-for="(pokemon, index) in this.likedPokemons" :key="index">
                    <li style="align-text: left">{{pokemon.name}}</li>
                  </ul>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-info text-white" data-bs-dismiss="modal">Okay</button>

                </div>
              </div>
            </div>
          </div>

					<!-- hates modal -->
					<div class="modal fade" :id="`hatesModal-${user.id}`" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header bg-danger">
                  <h5 class="modal-title text-white" id="exampleModalLabel">Hated Pokemons by {{user.email}}</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                  <ul v-for="(pokemon, index) in this.hatedPokemons" :key="index">
                    <li style="align-text: left">{{pokemon.name}}</li>
                  </ul>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-info text-white" data-bs-dismiss="modal">Okay</button>

                </div>
              </div>
            </div>
          </div>


        </tr>
      </tbody>
    </table>





</template>

<script>
export default {

 data(){
  return{
     users: [],
     likedPokemons: [],
		 hatedPokemons:[]

  }
 },

  methods: {
    fetchData() {
      axios
        .get("/api/users")
        .then((result) => {
          const data = result.data;

          this.users = data

        })
        .catch((error) => {
          console.log("There is a problem: ", error);
        });
    },

    fetchLikedPokemonData(user_id){
        axios
        .get("/api/users/fetchLikes/"+ user_id)
        .then((result) => {
          const data = result.data;

          this.likedPokemons = data
         // console.log("Poke", data);
        })
        .catch((error) => {
          console.log("There is a problem: ", error);
        });
    },

    fetchHatedPokemonData(user_id){
        axios
        .get("/api/users/fetchHates/"+ user_id)
        .then((result) => {
          const data = result.data;

          this.hatedPokemons = data
         // console.log("Poke", data);
        })
        .catch((error) => {
          console.log("There is a problem: ", error);
        });
    }


  },

  created(){
   this.fetchData();

  }

};
</script>