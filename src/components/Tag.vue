<template>
    <span class="p-2">{{ name }}:{{ value }}</span>
</template>

<script>
export default {
    props: {
        name: {
            type: String,
            required: true,
        },
        value: {
            type: String,
            default: "",
        },
    }
}
</script>
