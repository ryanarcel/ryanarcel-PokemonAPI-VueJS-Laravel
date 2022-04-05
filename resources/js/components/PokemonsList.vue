<template>
  <div class="home">
    <div class="container all-container">
      <div v-for="(pokemon, index) in pokemons" :key="index">
        <PokemonView :pokemon="pokemon" class="pokemon-view"/>
      </div>
    </div>
  </div>
</template>

<script>
import PokemonView from "./PokemonView.vue";

export default {
  props: ["pokemons"],
  components: { PokemonView },

  methods:{

  }

};
</script>
<style scoped>

.all-container {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  justify-content: center;
}
.pokemon-view {
  margin-top: 25px;
  font-size: 21px;
  text-align: center;
  animation: fadein 2s;
  -moz-animation: fadein 2s; /* Firefox */
  -webkit-animation: fadein 2s; /* Safari and Chrome */
  -o-animation: fadein 2s; /* Opera */
}
@keyframes fadein {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}
@-moz-keyframes fadein {
  /* Firefox */
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}
@-webkit-keyframes fadein {
  /* Safari and Chrome */
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}
@-o-keyframes fadein {
  /* Opera */
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}
</style>