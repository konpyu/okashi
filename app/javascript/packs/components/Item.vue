<template>
    <div class="item">
        <p>{{ this.id }} -- {{ getBody.body }}
            <span @click="removeItem">remove</span>
        </p>
    
    </div>
</template>

<script>
export default {
    name: 'item',
    props: ['id', 'test'],
    data() {
        return {
        }
    },
    mounted() {
        //console.log(this.$store.state.items)
        //console.log(this.id)
        //console.log(this.test)
    },
    methods: {
        removeItem() {
            let res = confirm("are you sure?")
            if (res) {
                this.$emit('remove-item', this.id)
            }
        }
    },

    computed: {
        getBody() {
            return this.$store.state.items[this.id]
        }
    }

}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

</style>
