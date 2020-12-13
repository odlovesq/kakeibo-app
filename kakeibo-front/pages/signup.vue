<template>
  <v-container>
    <keep-alive>
      <component :user="user" @confirmation-button-click="setUserInfo" v-bind:is="subPage"></component>
    </keep-alive>
  </v-container>
</template>

<script>
import SignupInput from '@/components/signup/SignupInput.vue'
import SignupConfirmation from '@/components/signup/SignupConfirmation.vue'
export default {
  name: 'Signup',
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
    setUserInfo(user) {
      this.user.nickname = user.nickname
      this.user.password = user.password
      this.user.email = user.email
      this.user.password_confirmation = user.password_confirmation
    },
  },
};
</script>
