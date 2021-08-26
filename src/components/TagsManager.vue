<template>
    <div>
        <tag v-for="(item) in selectedTags" :key="item.name+item.value" :name="item.name" :value="item.value" />
    </div>
</template>

<script>
import Tag from "../components/Tag.vue";

export default {
    components: {
        Tag,
    },
    props: {
        tags: {
            type: Array,
            required: true,
        },
        preSelectedTags: {
            type: Array,
            default: () => [],
        },
    },
    data() {
        return {
            newTags: [],
            selectedTags: this.preSelectedTags,
        }
    },
    watch: {
        preSelectedTags(gotTags) {
            if (gotTags.length > 0 && this.selectedTags.length === 0) {
                this.selectedTags = gotTags;
            }
        }
    }
}
</script>

<style>

</style>
