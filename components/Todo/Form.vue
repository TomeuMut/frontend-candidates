<template>
  <div>
    <form class="c-form" @submit.prevent="addTodo">
      <input
        v-model="todoName"
        class="c-input__text"
        placeholder="Ex: Practise my English speaking people"
      />
      <button class="c-btn c-btn__input" type="submit">
        Add
        <i class="fas fa-plus"></i>
      </button>
    </form>
  </div>
</template>
<script lang="ts">
export default {
  data() {
    return {
      todoName: '' as string,
    }
  },
  methods: {
    addTodo() {
      if (this.todoName) {
        this.$store.commit('todos/add', this.todoName)
        this.todoName = ''
      } else {
        alert('Please fill the Task Field!')
      }
    },
  },
}
</script>
