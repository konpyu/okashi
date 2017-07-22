<template>
  <div class="hello">

    <form id="itemForm" v-on:submit.prevent="addItem">
      <input v-model="body" placeholder="write me">
      <p v-if="error">{{ error }}</p>
      <input type="submit" value="Add Item">
    </form>

    <p v-for="(value, key, index) in items">
      <!-- <span>{{ item.body }}</span> -->
      <item :test="msg" :id="key"></item>
    </p>


    <h1>{{ msg }}</h1>
    <router-link to="following">GO USER</router-link>
  </div>
</template>

<script>
import axios from 'axios'
import { mapState } from 'vuex'
import Item from './item.vue'

export default {
  name: 'hello',
  data () {
    return {
      msg: 'Welcome to Your Vue.js App',
      body: "",
      error: "",
      items: this.$store.state.items
    }
  },
  mounted () {
    //this.test()
    //this.fetchItem()
    this.$store.dispatch("FETCH_ITEM")
        .then((res) => {
          
        })
  },
  components: { Item },
  methods: {
    addItem: function() {
      if (this.body === "") {
        this.error = "write something"
        return
      }
      const data = {
        body: this.body,
      }
      this.$store.dispatch('POST_ITEM', { item: { data } })
        .then( (res) => {
          console.log(res)
          this.body = ""

        })

    },
    test: function(res) {
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
h1, h2 {
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
</style>
