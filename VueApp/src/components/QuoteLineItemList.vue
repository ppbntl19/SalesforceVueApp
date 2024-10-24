<script>
export default {
  props: {
    quoteLineItems: Array
    }
}

</script>
<template>  
    <div>
    <h6>Quote Line Items</h6>
    <div v-for="qli in quoteLineItems" :key="qli.Id">
        <p>{{ qli.Name }}: {{ qli.Quantity }} @ {{ qli.UnitPrice }}</p>
    </div>
</div>
</template>


