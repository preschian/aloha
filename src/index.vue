<template>
  <home />
</template>

<script>
import home from './components/home'

export default {
  components: {
    home
  }
}
</script>

<style>
html {
  box-sizing: border-box;
}

*,
*:before,
*:after {
  box-sizing: inherit;
}

* {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
  margin: 0;
}

.container {
  max-width: 960px;
  margin: 32px auto;
}

.hero {
  background-color: #ebebeb;
  border: 0;
  border-radius: 4px;
  cursor: pointer;
  display: inline-block;
  font-size: 16px;
  margin-top: 16px;
  margin-right: 8px;
  padding: 4px 16px;
}
</style>
