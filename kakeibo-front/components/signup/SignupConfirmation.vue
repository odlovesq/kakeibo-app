<template>
  <v-container>
    <v-card width="400px" class="mx-auto mt-5">
      <v-card-title>
        <h1 class="display-1">
          内容確認
        </h1>
      </v-card-title>
      <v-card-text>
        <v-text-field
          :value="user.nickname"
          label="ニックネーム"
          outlined
          readonly
        />

        <v-text-field
          :value="user.email"
          label="メールアドレス"
          outlined
          readonly
        />

        <v-text-field
          :value="user.password | passwordMask"
          label="パスワード"
          outlined
          readonly
        />
      </v-card-text>

      <v-card-actions>
        <router-link to="/signup">戻る</router-link>
      </v-card-actions>
      <v-card-actions>
        <v-btn
          color="light-green darken-1"
          class="white--text"
          @click="registerUser"
        >
          新規登録
        </v-btn>
      </v-card-actions>
    </v-card>
  </v-container>
</template>

<script>
export default {
  name: 'SignupConfirmation',
  auth: 'guest',
  props: {
    'user': {
      type: Object,
      required: true
    }
  },
  filters: {
    passwordMask: function(val) {
      return '*'.repeat(val.length)
    },
  },
  methods: {
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
