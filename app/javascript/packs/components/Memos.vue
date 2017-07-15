<template>
  <div>
    <h3>Memo!</h3>
    <div v-for="memo in memos">
      <p>{{ memo.comment }} -- {{ memo.created_at }}</p>
    </div>

    <form id="memoForm" v-on:submit.prevent="addMemo">
      <input v-model="message" placeholder="edit me">
      <p v-if="error">{{ error }}</p>
      <input type="submit" value="Add User">
    </form>
  </div>
</template>

<script>
export default {
  name: 'Memos',
  data () {
    return {
      memos: [],
      message: "",
      error: "",
    }
  },
  computed: {
  },
  methods: {
    initMemo: function() {
      this.memos.push({ comment: "月亭方正", created_at: "2017-03-01 12:21" });
      this.memos.push({ comment: "はマダ", created_at: "2017-03-01 12:21" });
      this.memos.push({ comment: "まつもとひ", created_at: "2017-03-01 12:21" });
    },
    addMemo: function() {
      if (this.message === "") {
        this.error = "何か書いてな"
        return;
      }
      //console.log(this.message)
      this.memos.push({ comment: this.message, created_at: "2017-03-01 12:21" })
      this.message = ""
      this.error = ""
    }
  },
  mounted () {
    this.initMemo();
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