<template>
    <div>
        <h4 class="mb-3">{{ $t("Tags") }}</h4>
        <div class="mb-3 form-control disabled p-1 rounded-1">
            <tag
                v-for="item in selectedTags"
                :key="item.id"
                :item="item"
                :remove="removeTag"
            />
        </div>
        <div>
            <select
                id="snewDraftTagName"
                v-model="newDraftTag.select"
                class="form-select mb-2"
                required
            >
                <option value="0" disabled selected>{{ $t("Add...") }}</option>
                <option v-for="tag in tags" :key="tag.id" :value="tag.id">
                    {{ tag.name }}
                </option>
                <option value="-1">{{ $t("New...") }}</option>
            </select>
            <div v-show="newDraftTag.select == -1" class="d-flex mb-2">
                <div class="w-50 pe-2">
                    <input class="form-control" placeholder="name" />
                </div>
                <div class="w-50 ps-2">
                    <input class="form-control" placeholder="color" />
                </div>
            </div>
            <input class="form-control mb-2" placeholder="value (optional)" />
            <div class="mb-2">
                <button
                    class="btn btn-secondary float-end"
                    :disabled="processing"
                >
                    {{ $t("Add") }}
                </button>
            </div>
        </div>
    </div>
</template>

<script>
import VueMultiselect from "vue-multiselect";
import Tag from "../components/Tag.vue";

export default {
    components: {
        Tag,
        VueMultiselect,
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
            processing: false,
            newTags: [],
            newDraftTag: { select: 0 },
            selectedTags: this.preSelectedTags,
        };
    },
    watch: {
        preSelectedTags(gotTags) {
            if (gotTags.length > 0 && this.selectedTags.length === 0) {
                this.selectedTags = gotTags;
            }
        },
    },
    methods: {
        removeTag(id) {
            console.log(id + " not implemented yet");
        },
    },
};
</script>

<style scoped></style>
