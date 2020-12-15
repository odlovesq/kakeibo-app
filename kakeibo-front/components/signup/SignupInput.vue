<template>
  <v-container>
    <v-card width="400px" class="mx-auto mt-5">
      <v-card-title>
        <h1 class="display-1">
          新規登録
        </h1>
      </v-card-title>
      <v-card-text>
        <v-form ref="form" lazy-validation>
          <v-text-field
            v-model="user.nickname"
            prepend-icon="mdi-account"
            label="ニックネーム"
          />
          <v-text-field
            v-model="user.email"
            prepend-icon="mdi-email"
            label="メールアドレス"
          />
          <v-text-field
            v-model="user.password"
            prepend-icon="mdi-lock"
            append-icon="mdi-eye-off"
            label="パスワード"
          />
          <v-text-field
            v-model="user.password_confirmation"
            prepend-icon="mdi-lock"
            append-icon="mdi-eye-off"
            label="パスワード確認"
          />
          <v-card-actions>
            <router-link @click.native="clickedNextButton" :to="{ hash: '#confirmation' }">次へ</router-link>
          </v-card-actions>
        </v-form>
      </v-card-text>
    </v-card>
  </v-container>
</template>

<script>
export default {
  name: 'SignupInput',
  auth: 'guest',
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
    clickedNextButton() {
      this.$emit('confirmation-button-click', this.user);
    },
  },
};
</script>
