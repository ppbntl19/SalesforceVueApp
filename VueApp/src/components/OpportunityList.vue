<script>
import QuoteList from './QuoteList.vue'

import getAccountOpportunity from "@salesforce/apex/AccountOpportunityController.getAccountOpportunity";

export default {
  name: "OpportunityList",
  props: {
    recordId: String
  },
  data() {
    return {
      opportunities: []
    }
  },

  components: {
    QuoteList
  },
  methods: {
    handleClick: function (accountId) {
      const evt = new CustomEvent("refresh", {
        detail: { accountId },
        bubbles: true,
        composed: true
      });
      // Here we reference the `accountList` ref to dispatch the native event.
      this.$refs.accountList.dispatchEvent(evt);
    }
  },
  mounted: function () {
    getAccountOpportunity({ accountIds:[ this.recordId ]})
      .then((result) => {
        this.opportunities = result
      })
      .catch((error) => console.log(error));
  }
}

</script>

<template>
  <div class="slds-card" ref="accountList">
    <div class="slds-card__header slds-grid slds-grid_align-spread">
      <h3 class="slds-text-heading_medium slds-m-bottom_medium">Opportunities - {{ recordId }}</h3>
      <button class="slds-button slds-button_neutral" v-on:click="handleClick(recordId)">Refresh</button>
    </div>
    <div class="slds-card__body">
      <ul class="slds-list_dotted">
        <li v-for="opportunity in opportunities" :key="opportunity.Id">
          <div class="slds-box slds-theme_default slds-m-bottom_small">
            <h4 class="slds-text-heading_small">{{ opportunity.Name }} - {{ opportunity.StageName }}</h4>
            <p>Amount: {{ opportunity.Amount }}</p>
            <p>Close Date: {{ opportunity.CloseDate }}</p>
            <QuoteList :quotes="opportunity.Quotes"></QuoteList>
          </div>
        </li>
      </ul>
    </div>
  </div>
</template>
