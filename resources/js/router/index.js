import {createRouter, createWebHistory} from 'vue-router'

import Home from '../pages/Home'
import Register from '../pages/Register'
import Login from '../pages/Login'

import AccountView from '../components/account/AccountView'
import Dashboard from '../components/Dashboard'
import LikedPokemons from '../components/LikedPokemons'
import HatedPokemons from '../components/HatedPokemons'
import OtherUsers from '../components/OtherUsers'

const routes = [
    {
        name: 'Home',
        path: '/',
        component: Home
    },
    {
        name: 'Dashboard',
        path: '/dashboard',
        component: Dashboard
    },
    {
        name: 'Register',
        path: '/register',
        component: Register
    },
    {
        name: 'Login',
        path: '/login',
        component: Login
    },
    {
        name: 'AccountView',
        path: '/account-view',
        component: AccountView
    },

    {
        name: 'LikedPokemons',
        path: '/liked-pokemons',
        component: LikedPokemons
    },

    {
        name: 'HatedPokemons',
        path: '/hated-pokemons',
        component: HatedPokemons
    },
    {
        name: 'OtherUsers',
        path: '/other-users',
        component: OtherUsers
    }

]

const router = createRouter({
    history: createWebHistory(process.env.BASE_URL),
    routes
})

export default router