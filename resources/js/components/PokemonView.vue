<template>
  <div class="pokemonView">
    <div class="card shadow mt-3 poke-card" :class="this.thisPokemon.type">
      <div>
        <div class="card-body card-content">
          <h6 class="pokemon-id">{{ this.thisPokemon.id }}</h6>

          <img :src="this.thisPokemon.imageLink" />
          <h5 class="pokemon-name fw-bold mt-3">
            {{ pokemon.name.toUpperCase() }}
          </h5>
          <p class="pokemon-type">
            Type: <b>{{ this.thisPokemon.type }}</b>
          </p>
          <button
            class="btn btn-primary detailsButton"
            data-bs-toggle="modal"
            :data-bs-target="`#detailsModal-${this.thisPokemon.id }`"
          >
            More Details
          </button>

          <div class="icons">
            <font-awesome-icon
              class="thumbs-up like-icon liked"
              icon="thumbs-up"
              @click="likePokemon"
            />
            <font-awesome-icon
              class="thumbs-up hate-icon hated"
              icon="thumbs-down"
              @click="hatePokemon"
            />
          </div>

          <DetailsModal
            :id="`detailsModal-${this.thisPokemon.id }`"
            :name="pokemon.name"
            :height="this.thisPokemon.height"
            :weight="this.thisPokemon.weight"
            :abilities="this.thisPokemon.abilities"
          />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import DetailsModal from "./DetailsModal";

export default {
  name: "PokemonView",
  props: ["pokemon"],

  components: { DetailsModal },

  data() {
    return {
      user_id: 0,

      thisPokemon:{
        id: 0,
        name: "",
        imageLink: "",
        height: "",
        weight: "",
        abilities: [],
        type: "",
      },

      newPokemon: {
        pokemon_id: null,
        name: "",
        user_id: null,
      },

      liked: false,
      hated: false,
    };
  },

  methods: {

    fetchIndivData() {

       axios.get(`https://pokeapi.co/api/v2/pokemon/${this.pokemon.name}`)
      .then(result => {
          const data = result.data;
          this.setData(data);
          console.log("poke id: ",data.id)

      }).catch((err) => {
        console.log("Error ",err);
      });
    },

    setData(data) {
      this.thisPokemon.id = data.id;
      this.thisPokemon.name = data.name;
      this.thisPokemon.imageLink = data.sprites.other.dream_world.front_default;
      this.thisPokemon.height = data.height;
      this.thisPokemon.weight = data.weight;
      this.thisPokemon.type = data.types[0].type.name;

      data.abilities.forEach((ability) => {
        this.thisPokemon.abilities = [...this.thisPokemon.abilities, ability.ability.name];
      });
    },

    likePokemon() {
      this.newPokemon.pokemon_id = this.thisPokemon.id;
      this.newPokemon.name = this.thisPokemon.name;
      this.newPokemon.user_id = this.user_id;

      axios
        .post("api/pokemons/like/"+this.user_id+"/"+this.thisPokemon.id, {
          pokemon: this.newPokemon,
        })
        .then((response) => {
          if (response.status == 200) {
            alert( response.data);
          }
        })
        .catch((error) => {
          console.log("There is a problem: ", error);
        })

    },

    hatePokemon() {
      this.newPokemon.pokemon_id = this.thisPokemon.id;
      this.newPokemon.name = this.thisPokemon.name;
      this.newPokemon.user_id = this.user_id;

      axios
        .post("api/pokemons/hate/"+this.user_id+"/"+this.thisPokemon.id, {
          pokemon: this.newPokemon,
        })
        .then((response) => {
          if (response.status == 200) {
            alert(response.data);
          }
        })
        .catch((error) => {
          console.log("There is a problem: ", error);
        })

    },

    checkIfLiked(poke_id){

      axios.get("api/pokemons/checkLike/"+ poke_id)
      .then(result => {
        this.liked = result.data;
      })
      .catch((err) => {
        console.log("Error ",err);
      });
    },

    checkIfHated(poke_id){

      axios.get("api/pokemons/checkHate/"+ poke_id)
      .then(result => {
        this.hated = result.data;
      })
      .catch((err) => {
        console.log("Error ",err);
      });
    }
  },

  mounted() {
    this.fetchIndivData();
    this.user_id = sessionStorage.getItem("user_id");
    console.log("pokemon id", this.pokemon.id)
  },
};
</script>

<style scoped>
.pokemonView{
  font-size: 16px;
}
.poke-card {
  width: 250px;
  display: flex;
  margin: 5px;
  border-radius: 10px;
}
.card-content {
  margin: 0 auto;
}
img {
  display: block;
  margin-left: auto;
  margin-right: auto;
  height: 150px;
  width: 150px;
  /* margin: auto; */
}
.pokemon-id,
.pokemon-name,
.pokemon-type {
  text-align: center;
}
.pokemon-type{
  font-size: 16px;
}
.detailsButton {
  display: block;
  margin-left: auto;
  margin-right: auto;
}

.rock {
  background-image: linear-gradient(to top, #c79081 0%, #835b3c 75%);
}
.rock:hover {
  background-image: linear-gradient(to top, #dfb3a7 0%, #ac8568 75%);
}

.ghost {
  background-image: linear-gradient(to top, #cfd9df 0%, #e2ebf0 75%);
}
.ghost:hover {
  background-image: linear-gradient(to top, #bee2f8 0%, #a3b9c5 75%);
}

.electric {
  background-image: linear-gradient(to right, #f83600 0%, #f9d423 75%);
}
.electric:hover {
  background-image: linear-gradient(to right, #f37c5c 0%, #fff0a6 75%);
}

.bug {
  background-image: linear-gradient(to top, #e6b980 0%, #eacda3 75%);
}
.bug:hover {
  background-image: linear-gradient(to top, #f8885b 0%, #fda428 75%);
}

.poison {
  background-image: linear-gradient(to top, #df89b5 0%, #bfd9fe 75%);
}
.poison:hover {
  background-image: linear-gradient(to top, #f576e4 0%, #82b6ff 75%);
}

.normal {
  background-image: linear-gradient(-225deg, #e3fdf5 0%, #ffe6fa 75%);
}
.normal:hover {
  background-image: linear-gradient(-225deg, #c0fae9 0%, #ecb7e2 75%);
}

.fairy {
  background-image: linear-gradient(
    to top,
    #ff9a9e 0%,
    #fecfef 99%,
    #fecfef 75%
  );
}
.fairy:hover {
  background-image: linear-gradient(
    to top,
    #e07c80 0%,
    #ffaae4 99%,
    #ce94bb 75%
  );
}

.fire {
  background-image: linear-gradient(120deg, #f6d365 0%, #fda085 75%);
}
.fire:hover {
  background-image: linear-gradient(120deg, #ebc23d 0%, #fa744e 75%);
}

.grass {
  background-image: linear-gradient(120deg, #d4fc79 0%, #96e6a1 75%);
}
.grass:hover {
  background-image: linear-gradient(120deg, #b0ff7b 0%, #39ec54 75%);
}

.water {
  background-image: linear-gradient(120deg, #89f7fe 0%, #66a6ff 75%);
}
.water:hover {
  background-image: linear-gradient(120deg, #62d3db 0%, #2d7dec 75%);
}

.ground {
  background-image: linear-gradient(315deg, #772f1a 0%, #f2a65a 75%);
}
.ground:hover {
  background-image: linear-gradient(315deg, #993e23 0%, #facc9e 75%);
}
.icons {
  display: flex;
  justify-content: center;
  padding-top: 10px;
}
.like-icon {
  margin-left: 10px;
  margin-right: 10px;
  height: 25px;
  width: 25px;
  display: flex;
}
.like-icon:hover,
.hate-icon:hover {
  color: rgb(255, 230, 0);
}
.hate-icon {
  margin-left: 10px;
  margin-right: 10px;
  height: 25px;
  width: 25px;
  display: flex;
}

.liked {
  color: #0004ff;
}
.hated {
  color: rgb(226, 43, 43);
}
</style>