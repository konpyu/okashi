<template>
  <div>
    <h1>{{ msg }}</h1>

    <h3>the number is {{ currentCounter }}</h3>
    <h2>User</h2>
    <!-- TEST -->
    <p>{{ name }}</p>
    <p>{{ followingCount }}</p>
    <p>{{ postCount }}</p>

    <router-link :to="{ name: 'user_following' }"> _Followings1_ </router-link>
    <router-link :to="followingPath"> _Followings2_ </router-link>
    <router-view></router-view>
    <p @click="incrementCounter">increment</p>
  </div>
</template>

<script>
import { mapState } from 'vuex'
export default {
  
  name: 'user',
  data () {
    return {
      msg: 'ユーザですぜ',
      userName: "konpyu"
    }
  },
  computed: {
    followingPath () {
      return this.$route.params.user + "/" + "following"
    },
    currentCounter () {
      //return 111111111
      return this.$store.state.count
    },
    ...mapState({
        name: state => state.user.name,
        followingCount: state => state.user.followingCount,
        postCount: state => state.user.postCount,
      }
    )
    // getUserName () {
    //   return this.$store.state.user.name
    // },
    // getFollowingCount () {
    //   return this.$store.state.user.followingCount
    // },
    // getPostCount () {
    //   return this.$store.state.user.postCount
    // }
  },
  methods: {
    incrementCounter () {
      //console.log("increment surude")
      this.$store.commit('increment')
      this.$store.commit('SET_USER', { user: { followingCount:111, postCount:222, name: "konpPYU" }} )
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
