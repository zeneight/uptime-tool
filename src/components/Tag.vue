<template>
    <div class="m-2 py-1 px-3 rounded d-inline-flex" :style="{ backgroundColor: item.color }">{{ displayText }}<span class="ps-1 btn-remove" @click="remove(item.id)"><font-awesome-icon icon="times" /></span></div>
</template>

<script>
export default {
    props: {
        item: {
            type: Object,
            required: true,
        },
        remove: {
            type: Function,
            required: true,
        }
    },
    computed: {
        displayText() {
            if (this.value == "") {
                return this.name;
            } else {
                return `${this.item.name}: ${this.item.value}`;
            }
        }
    }
}
</script>

<style scoped>
.btn-remove {
    font-size: 0.9em;
    opacity: 0.3;
}

.btn-remove:hover {
    opacity: 1;
}
</style>
