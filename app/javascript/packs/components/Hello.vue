<template>
  <div class="hello">

<div class="siteHeader">
  <!-- This section gets pushed to the left side-->
  <div class="siteHeader__section">
    <div class="siteHeader__item siteHeaderLogo">
      <div class="fa fa-inbox"></div>
    </div>
    <div class="siteHeader__item siteHeaderButton is-site-header-item-selected">Inbox</div>
    <div class="siteHeader__item siteHeaderButton">Sent</div>
    <div class="siteHeader__item siteHeaderButton">Trash</div>
  </div>
  <!-- This section gets pushed to the right side-->
  <div class="siteHeader__section">
    <div class="siteHeader__item siteHeaderButton">Settings</div>
  </div>
</div>

    <!-- hoge -->

    <edit-item-modal :show="isOpenModal"></edit-item-modal>
    
    <div @click="openModal">_create_modal_</div>
  
    <form id="itemForm" v-on:submit.prevent="addItem">
      <input v-model="body" placeholder="write me">
      <p v-if="error">{{ error }}</p>
      <input type="submit" value="Add Item">
    </form>
  
    <p v-for="(value, key, index) in items">
      <!-- <span>{{ item.body }}</span> -->
      <item @remove-item="removeItem" :test="msg" :id="key"></item>
    </p>
  
    <h1>{{ msg }}</h1>
    <router-link to="following">GO USER</router-link>
  </div>
</template>

<script>
import axios from 'axios'
import { mapState } from 'vuex'
import Item from './Item.vue'
import EditItemModal from './editItemModal.vue'

export default {
  name: 'hello',
  data() {
    return {
      msg: 'Welcome to Your Vue.js App',
      body: "",
      error: "",
      items: this.$store.state.items,
      isOpenModal: false
    }
  },
  mounted() {
    //https://stackoverflow.com/questions/40957008/how-to-access-to-a-child-method-from-the-parent-in-vue-js
    console.log(this.$children)
    //this.test()
    //this.fetchItem()
    this.$store.dispatch("FETCH_ITEM")
      .then((res) => {

      })
  },
  components: { Item, EditItemModal },
  methods: {
    openModal: function(arg) {
      this.isOpenModal = true
    },
    removeItem: function (arg) {
      this.$store.dispatch("REMOVE_ITEM", { id: arg })
    },
    addItem: function () {
      if (this.body === "") {
        this.error = "write something"
        return
      }
      const data = {
        body: this.body,
      }
      this.$store.dispatch('POST_ITEM', { item: { data } })
        .then((res) => {
          this.body = ""
        })

    },
    test: function (res) {
      console.log("------ called -------")
    }
  },

  /*
  computed: 
    mapState({
      items: "items"
    })
  */
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h1,
h2 {
  font-weight: normal;
}

ul {
  list-style-type: none;
  padding: 0;
}

li {
  display: inline-block;
  margin: 0 10px;
}

a {
  color: #42b983;
}




.siteHeader {
  display: flex;
  justify-content: flex-start;
  padding: 10px;
  background-color: #56727C;
}

  .siteHeader__section {
    display: flex;
    align-items: center;
  }

    .siteHeader__item {
      padding: 5px 15px;
      font-size: 12px;

      & + & {
        margin-left: 5px;
      }

      &.is-site-header-item-selected {
        color: #FFFFFF;
        background-color: #415F69;
        border-radius: 4px;
      }
    }

    .siteHeaderLogo {
      font-size: 20px;
      line-height: 0;
      color: white;
    }

    .siteHeaderButton {
      cursor: pointer;
      color: #D9E9EF;
    }






.oks-test {
  color: red;
}

.oks-flex-container {
  display: -webkit-flex; /* Safari */
  display: flex;
}

.oks-flex-item {
  cursor: pointer;
  border-bottom: 2px solid transparent;
  border-bottom-color: #4EBBE4;
  color: #16A2D7;
  font-size: 12px;
  padding: 10px 20px;
}


</style>
