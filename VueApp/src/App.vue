<script>
import OpportunityList from './components/OpportunityList.vue'
export default {
    name: "App",
    props: {
        recordId: String
    },
    components: {
      OpportunityList
  }
  };
</script>

<template>
  <main>
    <OpportunityList  :recordId="recordId"  />
  </main>
</template>

