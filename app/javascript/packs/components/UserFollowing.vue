<template>
  <div class="hello">
    <h1>{{ msg }}</h1>
    <h2>FOLLOW</h2>

    <p @click="incrementCounter"> UPPPPP </p>
    <p @click="refreshUser"> REFRESH USER </p>
  </div>
</template>

<script>
export default {
  name: 'UserFollowing',
  data () {
    return {
      msg: 'Following!',
      loading: false,
    }
  },
  mounted () {
  },
  methods: {
    incrementCounter () {
      console.log("--- user following ---")
      this.$store.commit('increment')
    },
    refreshUser () {
      if (this.loading) {
        return
      }
      this.loading = true
      console.log("--------------- refreshUser ---------------------")
      this.$store.dispatch('FETCH_USERS', [1,2]).then(
        () => {
          setTimeout( () => {
              this.loading = false
            }
          ,1000)
        }
      ).catch(
        () => {
          this.loading = false
        }
      )
    }
  }
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
