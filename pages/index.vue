<template>
  <section class="container">
    <div>
      <div class="py-7">
        <h1>
          <i class="fa fa-clipboard-list" />
          Nuxt JS Todo
        </h1>
        <h2>A todo list manager made with Nuxt.js</h2>
      </div>
      <TodoForm></TodoForm>
      <TodoList></TodoList>
    </div>
  </section>
</template>

<script>
// import TodoList from '../components/TodoList'

export default {
  components: {
    // TodoList,
  },
}
</script>
