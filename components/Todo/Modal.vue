<template>
  <div v-if="show" class="c-modal__bg">
    <div class="c-modal__content">
      <div class="c-modal__title">Are you sure to delete this item?</div>
      <div class="c-modal__todo">{{ todo.name }}</div>
      <div class="flex items-center gap-4 p-8 justify-center">
        <button class="c-btn__delete" @click="$emit('confirm')">
          Delete
          <i class="fas fa-times"></i>
        </button>
        <button class="c-btn__cancel" @click="$emit('cancel')">
          Cancel
          <i class="fas fa-times-circle"></i>
        </button>
      </div>
    </div>
  </div>
</template>
<script lang="ts">
export default {
  props: {
    show: {
      type: Boolean,
      required: true,
    },
    todo: {
      type: Object,
      default: null,
    },
  },
}
</script>
