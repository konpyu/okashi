import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'

Vue.use(Vuex)

const store = new Vuex.Store({
    state: {
        count: 0,
        user: {
            name: "",
            followingCount: 0,
            postCount: 0
        },
        items: { /* key to value */ }
    },
    mutations: {
        increment(state) {
            state.count++
        },
        SET_USER: (state, { user }) => {
            state.user = user
        },
        SET_ITEM: (state, { item }) => {
            Vue.set(state.items, item.id, item)
        },
        REMOVE_ITEM: (state, { id }) => {
            Vue.delete(state.items, id)
        }
    },
    actions: {
        POST_ITEM: ({ commit, state }, { item }) => {
            axios.post("/api/v1/items", { comment: item.data.body, title: item.data.body })
                .then((res) => {
                    console.log(res.data)
                    commit('SET_ITEM', { item: { id: res.data.id, body: res.data.comment }})
                })
        },
        FETCH_ITEM: ( { commit ,state }) => {
            axios.get("/api/v1/items")
                 .then((res) => {
                    console.log(res.data)
                    res.data.forEach(item => {
                       commit('SET_ITEM', { item: { id: item.id, body: item.comment }})
                    })
                 })
        },
        REMOVE_ITEM: ( {commit,state}, { id }) => {

            axios.delete("/api/v1/items/" + id)
                .then((res) => {
                    commit("REMOVE_ITEM", { id: id } )
                })
        }
    }
});

export default store

