<template>
  <div class="item">
      <p>{{ this.id  }} -- {{ getBody.body }}</p>
  </div>
</template>

<script>
export default {
  name: 'item',
  props: ['id', 'test'],
  data () {
    return {
    }
  },
  mounted () {
      //console.log(this.$store.state.items)
      //console.log(this.id)
      //console.log(this.test)
  },
  methods: {
  },
  
  computed: {
      getBody () {
          return this.$store.state.items[this.id]
      }
  }
  
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
