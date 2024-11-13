<template>
  <div class="c-list">
    <div class="c-list__titles">
      <div class="font-bold">Done</div>
      <div class="font-bold">Name</div>
      <div class="font-bold">Action</div>
    </div>
    <div v-for="todo in todos" :key="todo.id" class="c-list__item">
      <div class="c-list__check">
        <input
          type="checkbox"
          name=""
          :checked="todo.done"
          @change="isCheck(todo)"
        />
      </div>
      <div class="c-list__name">{{ todo.name }}</div>
      <div class="c-list__button">
        <button class="c-btn__delete" @click="openConfirmModal(todo)">
          Delete
          <i class="fas fa-times"></i>
        </button>
      </div>
    </div>
    <TodoModal
      :show="showConfirmModal"
      :todo="selectedTodo"
      @confirm="deleteTask"
      @cancel="closeConfirmModal"
    />
  </div>
</template>
<script lang="ts">
export interface Todo {
  id: number
  done: boolean
  name: string
}
export default {
  data() {
    return {
      showConfirmModal: false,
      todoToDelete: null as number | null,
      selectedTodo: null as Todo | null,
    }
  },
  computed: {
    todos() {
      return this.$store.state.todos.list
    },
  },
  methods: {
    openConfirmModal(todo: Todo) {
      this.selectedTodo = todo
      this.showConfirmModal = true
    },
    closeConfirmModal() {
      this.showConfirmModal = false
      this.todoToDelete = null
    },
    deleteTask() {
      if (this.selectedTodo) {
        this.$store.commit('todos/remove', this.selectedTodo)
        this.closeConfirmModal()
      }
    },
    isCheck(todo: Todo) {
      this.$store.commit('todos/update', { ...todo, done: !todo.done })
    },
  },
}
</script>
