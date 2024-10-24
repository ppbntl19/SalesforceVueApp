<script>
import QuoteList from './QuoteList.vue'

import getAccounts from "@salesforce/apex/AccountOpportunityController.getAccounts";

export default {
  name: "OpportunityList",
    props: {
      recordId : String
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
            const evt = new CustomEvent("sendaccount", {
                detail: { accountId },
                bubbles: true,
                composed: true
            });
            // Here we reference the `accountList` ref to dispatch the native event.
            this.$refs.accountList.dispatchEvent(evt);
        }
    },
    mounted: function () {
        getAccounts({accountId: this.recordId})
            .then((result) => {
              this.opportunities = result
            })
            .catch((error) => console.log(error));
    }
}

</script>

<template>
  <div>
    <h3>Opportunitie {{recordId}}s</h3>
    <div v-for="opportunity in opportunities" :key="opportunity.Id">
      <h4>{{ opportunity.Name }} - {{ opportunity.StageName }}</h4>
      <p>Amount: {{ opportunity.Amount }}</p>
      <p>Close Date: {{ opportunity.CloseDate }}</p>
      <QuoteList :quotes="opportunity.Quotes"></QuoteList>
    </div>
  </div>
</template>
