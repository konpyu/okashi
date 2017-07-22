<template>
    <modal name="edit-item">
        <p>HELLLLO</p>
    </modal>
</template>

<script>
export default {
    name: 'edit-item-modal',
    props: ['id'],
    data() {
        return {
            show: true
        }
    },
    mounted() {
        //this.$modal.show("edit-item")
        //console.log(this.$store.state.items)
        //console.log(this.id)
        //console.log(this.test)
    },
    methods: {
        test() {
            console.log("test-----------------------")
        }
    },
    computed: {
    }

}
</script>
<style scoped>
</style>