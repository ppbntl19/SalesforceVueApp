<script>
import QuoteLineItemList from './QuoteLineItemList.vue'
export default {
  props: {
    quotes: Array
    },
    components: {
      QuoteLineItemList
  }
}
</script>
<template>
  <div>
    <h5>Quotes</h5>
    <div v-for="quote in quotes" :key="quote.Id">
      <h6>{{ quote.Name }} - {{ quote.Status }}</h6>
      <p>Total Price: {{ quote.TotalPrice }}</p>

      <!-- Render Quote Line Items for each quote -->
      <QuoteLineItemList
        :quote-line-items="quote.QuoteLineItems"
      ></QuoteLineItemList>
    </div>
  </div>
</template>
