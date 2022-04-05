<template>
 <div class="modal fade" :id="`${id}`" tabindex="-1" aria-hidden="true">
   <div class="modal-dialog">
     <div class="modal-content">
       <div class="modal-header">
         <h5 class="modal-title fw-bold" >{{name.toUpperCase()}}</h5>
         <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
       </div>
       <div class="modal-body p-5">
         <div class="container">

            <table class="details-table ">
              <tr>
                <td class="fw-bold">Height:</td>
                <td>{{height * 10}} cm</td>
              </tr>
              <tr>
                <td class="fw-bold">Weight:</td>
                <td>{{weight * 0.1}} kg</td>
              </tr>
              <tr>
                <td >
                    <h6 class="mt-3"><b>Abilities:</b></h6>
                    <ul class="pl-5">
                      <li v-for="(ability, index) in abilities" :key="index">
                        <span class="ability ">{{ability}}</span>
                      </li>
                    </ul>
                </td>
              </tr>
            </table>

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
    height: 0,
    weight: 0,
    abilities: {}
  },
  created(){
   // console.log(this.abilities);
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

</style>
