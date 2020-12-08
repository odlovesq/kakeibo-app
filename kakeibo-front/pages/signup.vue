<template>
  <v-container>
    <keep-alive>
      <component :user="user" @catchUserInfo="saveUserInfo" v-bind:is="subPage"></component>
    </keep-alive>
  </v-container>
</template>

<script>
import SignupInput from '@/components/signup/SignupInput.vue'
import SignupConfirmation from '@/components/signup/SignupConfirmation.vue'
export default {
  name: 'App',
  auth: 'guest',
  computed: {
    subPage () {
      switch(this.$route.hash) {
        case '#confirmation':
          return SignupConfirmation
        default:
          return SignupInput
      }

    }
  },
  data() {
    return {
      user: {
        nickname: '',
        password: '',
        email: '',
        password_confirmation: '',
      },
    }
  },
  methods: {
    saveUserInfo(user) {
      this.user.nickname = user.nickname
      this.user.password = user.password
      this.user.email = user.email
      this.user.password_confirmation = user.password_confirmation
    },
    registerUser() {
      this.$axios.post('http://192.168.99.100:3000/api/v1/auth', this.user).then(response => {
        localStorage.setItem('access-token', response.headers['access-token'])
        localStorage.setItem('client', response.headers.client)
        localStorage.setItem('uid', response.headers.uid)
        localStorage.setItem('token-type', response.headers['token-type'])
        window.location.href = '/dashboard'
      })
      .catch(error => {
        console.log(error)
      })
    },
  },
};
</script>
