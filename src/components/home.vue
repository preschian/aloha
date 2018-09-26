<template>
  <div class="container">
    <h2>Top players by hero ⭐️</h2>
    <button class="hero" @click="getHero(1)">Anti Mage</button>
    <button class="hero" @click="getHero(2)">Axe</button>
    <button class="hero" @click="getHero(3)">Bane</button>
    <button class="hero" @click="getHero(4)">Bloodseeker</button>
    <button class="hero" @click="getHero(5)">Crystal Maiden</button>

    <div v-if="loading" class="loading">loading...</div>
    <div v-else class="list">
      <div class="list-user" v-for="user in rankings" :key="user.account_id">
        <div class="list-info">
          <div class="list-text">name: {{user.personaname}}</div>
          <div class="list-text">score: {{parseInt(user.score)}}</div>
        </div>
      </div>
    </div>
    <div v-if="error" class="loading">error</div>
  </div>
</template>

<script>
import axios from 'axios';
import MockAdapter from 'axios-mock-adapter';

if (process.env.MOCK_API === 'true') {
  const mock = new MockAdapter(axios);

  mock.onAny('https://api.opendota.com/api/rankings').reply(200, {
    rankings: [
      { account_id: 1, personaname: 'Qwerty', score: '90' },
      { account_id: 2, personaname: 'Asdfgh', score: '80' },
      { account_id: 3, personaname: 'Zxcvbn', score: '70' },
    ]
  });
}

export default {
  data() {
    return {
      loading: false,
      error: false,
      rankings: [],
    };
  },
  methods: {
    getHero(id) {
      this.loading = true;

      axios
        .get('https://api.opendota.com/api/rankings', {
          params: {
            hero_id: id
          }
        })
        .then(({ data: { rankings } }) => {
          this.rankings = rankings;
          this.loading = false;
        }).catch(() => this.error = true);
    },
  },
};
</script>

<style>
.list {
  font-size: 0;
  margin-top: 16px;
  width: calc(100% + 16px);
  margin-left: -8px;
  margin-right: -8px;
}

.list-user {
  display: inline-block;
  font-size: 16px;
  padding: 0 8px 8px 8px;
  width: 25%;
}

.list-info {
  background-color: #ebebeb;
  border-radius: 4px;
  padding: 8px;
}

.list-text {
  text-overflow: ellipsis;
  overflow: hidden;
  white-space: nowrap;
}

.loading {
  background-color: #ebebeb;
  border-radius: 4px;
  margin-top: 16px;
  padding: 8px;
  text-align: center;
}
</style>
