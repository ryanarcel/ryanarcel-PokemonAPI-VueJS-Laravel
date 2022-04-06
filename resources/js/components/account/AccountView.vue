<template>
  <div class="account-view">
    <div class="container">
      <h4>Welcome, {{this.loggedInEmail}}!</h4>
      <p class="text-primary">Double-click form to register and/or update information.</p>
      <div class="row shadow-lg">
        <div class="col rounded-start form-side">
          <h5 class="heading text-white">User Information</h5>

            <!-- form -->
            <div class="form" @dblclick="this.editable = true">
            <div class="mb-3">
              <label class="form-label text-white">First Name</label>
              <input
                type="text"
                id="fname"
                :disabled="this.editable==false"
                class="form-control"
                :class="this.editable ?  '': 'editableTrue'"
                v-model="this.userdetails.fname"
              />
            </div>
            <div class="mb-3">
              <label class="form-label text-white">Last Name</label>
              <input
                type="text"
                id="lname"
                :disabled="this.editable==false"
                class="form-control"
                :class="this.editable ?  '': 'editableTrue'"
                v-model="this.userdetails.lname"
              />
            </div>
            <div class="mb-3">
              <label class="form-label text-white">Sex</label>
              <input
                type="text"
                id="sex"
                :disabled="this.editable==false"
                class="form-control"
                :class="this.editable ?  '': 'editableTrue'"
                v-model="this.userdetails.sex"
              />
            </div>
            <div class="mb-3">
              <label class="form-label text-white">Status</label>
              <input
                type="text"
                id="status"
                :disabled="this.editable==false"
                class="form-control"
                :class="this.editable ?  '': 'editableTrue'"
                v-model="this.userdetails.status"
              />
            </div>
            <div class="mb-3">
              <label class="form-label text-white">Birthdate</label>
              <input
                type="date"
                id="bdate"
                :disabled="this.editable==false"
                class="form-control"
                :class="this.editable ?  '': 'editableTrue'"
                v-model="this.userdetails.bdate"
              />
            </div>
            <button :class="this.storeStatus === 'toCreate' ? 'btn btn-success text-white' : 'btn btn-info text-white'" :onClick="this.storeStatus === 'toCreate' ? createDetails : updateDetails" v-if="this.editable">
              {{
                this.storeStatus === 'toCreate'?
                "Save":
                "Update"
              }}

            </button>
          </div><!--end .form -->


        </div>

        <div class="col rounded-end image-side"></div>
      </div>
    </div>
  </div>
</template>

<script>
export default {

  data() {
    return{
      storeStatus: "",
      userdetails:{

        user_id: 0,
        fname: "",
        lname: "",
        sex: "",
        status: "",
        bdate: ""
      },
      editable: false,
      user_id: 0,
      loggedInEmail: ""
    }
  },

  methods: {

    fetchDetails(){
      axios.get('api/userdetail/'+this.user_id)
        .then(result => {
          console.log("userdetail: ", result.data);

          if(!result.data){
            this.storeStatus = "toCreate";
            this.userdetails.user_id = this.user_id;
            this.userdetails.fname = "";
            this.userdetails.lname = "";
            this.userdetails.sex = "",
            this.userdetails.status = "",
            this.userdetails.bdate = ""

          }
          else{
            this.storeStatus = "toUpdate";
            this.userdetails = result.data;
          }

          console.log("storeStatus: ", this.storeStatus);
        })
        .catch((err) => {
         console.log(err);
      });
    },

   createDetails(){

      console.log("Create Method: ", this.userdetails);

      axios.post('api/userdetail/store', {
         detail : this.userdetails
      })
      .then(result => {

          console.log("Create Result: ", result);
          alert("Information created");
          this.editable = false


      }).catch(err => {
        console.log(err)
      });
    },

    updateDetails(){
      console.log("Update Method");

      axios.put('api/userdetail/'+ this.user_id, {
         detail : this.userdetails
      })
      .then(result => {
        if(result.status == 200){
          alert("Information Updated");
          this.editable = false

        }
      }).catch(err => {
        console.log(err)
      });
     }

  },
  mounted() {
     this.user_id = sessionStorage.getItem("user_id");
     this.loggedInEmail = sessionStorage.getItem("email");
     this.fetchDetails();
     console.log("user ID: ", this.user_id);

  },
};
</script>
<style scoped>
  .account-view {
    padding-bottom: 100px;
    font-family: "Poppins";

  }
  .form {
    width: 50%;
    display: block;
    margin: auto;
  }
  .form-side,
  .image-side {
    height: 600px;
  }
  .form-side {
    background-image: linear-gradient(-225deg, #f77361 0%, #e1341e 75%);
  }
  .image-side {
    background-image: url("http://localhost:8000/image/21003.jpg");
    background-size: cover;
    background-repeat: no-repeat;
    background-position-x: center;
  }

  .heading {
    margin: 30px;
  }
  .container {
    padding-left: 100px;
    padding-right: 100px;
    padding-bottom: 50px;
  }
  .editableTrue{
    background-color: transparent;
    border: 0px;
    font-weight: bold;
    color: #61E5F7;
  }
  .editableBG{
    background-color: azure;
  }
</style>