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
    <h1>Quotes</h1>
    <div class="slds-card">
      <div class="slds-card__body">
        <ul class="slds-list_dotted">
          <li v-for="quote in quotes" :key="quote.Id">
            <div class="slds-box slds-theme_default slds-m-bottom_small">
              <h6>{{ quote.Name }} - {{ quote.Status }}</h6>
              <p>Total Price: {{ quote.TotalPrice }}</p>

              <!-- Render Quote Line Items for each quote -->
              <QuoteLineItemList :quote-line-items="quote.QuoteLineItems"></QuoteLineItemList>
            </div>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>
