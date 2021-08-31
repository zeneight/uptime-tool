<template>
    <div>
        <h4 class="mb-3">{{ $t("Tags") }}</h4>
        <div class="mb-3 p-1">
            <tag
                v-for="item in selectedTags"
                :key="item.id"
                :item="item"
                :remove="removeTag"
            />
        </div>
        <div>
            <vue-multiselect
                v-model="newDraftTag.select"
                class="mb-2"
                :options="tagOptions"
                :multiple="false"
                :searchable="true"
                placeholder="Add..."
                track-by="id"
                label="name"
            >
                <template #option="{ option }">
                    <div class="mx-2 py-1 px-3 rounded d-inline-flex"
                         style="margin-top: -5px; margin-bottom: -5px; height: 24px;"
                         :style="{ color: option.color ? 'white' : 'var(--bs-body-color)', backgroundColor: option.color + ' !important' }"
                    >
                        <span>
                            {{ option.name }}</span>
                    </div>
                </template>
                <template #singleLabel="{ option }">
                    <div class="py-1 px-3 rounded d-inline-flex"
                         style="height: 24px;"
                         :style="{ color: option.color ? 'white' : 'var(--bs-body-color)', backgroundColor: option.color + ' !important' }"
                    >
                        <span>{{ option.name }}</span>
                    </div>
                </template>
            </vue-multiselect>
            <div v-if="newDraftTag.select?.id == -1" class="d-flex mb-2">
                <div class="w-50 pe-2">
                    <input v-model="newDraftTag.name" class="form-control" :class="{'is-invalid': newDraftTag.nameInvalid}" placeholder="name" />
                    <div class="invalid-feedback">
                        Tag with this name already exist.
                    </div>
                </div>
                <div class="w-50 ps-2">
                    <vue-multiselect
                        v-model="newDraftTag.color"
                        :options="colorOptions"
                        :multiple="false"
                        :searchable="true"
                        placeholder="color"
                        track-by="color"
                        label="name"
                        select-label=""
                        deselect-label=""
                    >
                        <template #option="{ option }">
                            <div class="mx-2 py-1 px-3 rounded d-inline-flex"
                                 style="height: 24px; color: white;"
                                 :style="{ backgroundColor: option.color + ' !important' }"
                            >
                                <span>{{ option.name }}</span>
                            </div>
                        </template>
                        <template #singleLabel="{ option }">
                            <div class="py-1 px-3 rounded d-inline-flex"
                                 style="height: 24px; color: white;"
                                 :style="{ backgroundColor: option.color + ' !important' }"
                            >
                                <span>{{ option.name }}</span>
                            </div>
                        </template>
                    </vue-multiselect>
                </div>
            </div>
            <input v-model="newDraftTag.value" class="form-control mb-2" placeholder="value (optional)" />
            <div class="mb-2">
                <button
                    class="btn btn-secondary float-end"
                    :class="{ disabled: processing || newDraftTag.invalid }"
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
            removeTags: [],
            newDraftTag: {
                name: null,
                select: null,
                color: null,
                value: "",
                invalid: false,
                nameInvalid: false,
            },
        };
    },
    computed: {
        tagOptions() {
            return [
                ...this.tags,
                { name: this.$t("New..."),
                    id: -1 },
            ]
        },
        selectedTags() {
            return this.preSelectedTags.concat(this.newTags).filter(tag => !this.removeTags.includes(tag.id));
        },
        colorOptions() {
            return [
                { name: this.$t("Gray"),
                    color: "#4B5563" },
                { name: this.$t("Red"),
                    color: "#DC2626" },
                { name: this.$t("Orange"),
                    color: "#D97706" },
                { name: this.$t("Green"),
                    color: "#059669" },
                { name: this.$t("Blue"),
                    color: "#2563EB" },
                { name: this.$t("Indigo"),
                    color: "#4F46E5" },
                { name: this.$t("Purple"),
                    color: "#7C3AED" },
                { name: this.$t("Pink"),
                    color: "#DB2777" },
            ]
        }
    },
    watch: {
        "newDraftTag.name": function (newName) {
            this.newDraftTag.name = newName.trim();
            this.validateDraftTag();
        },
    },
    methods: {
        removeTag(id) {
            console.log(id + " not implemented yet");
        },
        validateDraftTag() {
            if (this.tags.filter(tag => tag.name === this.newDraftTag.name).length > 0) {
                this.newDraftTag.nameInvalid = true;
                this.newDraftTag.invalid = true;
            } else if (this.newDraftTag.color == null) {
                this.newDraftTag.nameInvalid = false;
                this.newDraftTag.invalid = true;
            } else {
                this.newDraftTag.invalid = false;
                this.newDraftTag.nameInvalid = false;
            }
        },
    },
};
</script>

<style scoped></style>
