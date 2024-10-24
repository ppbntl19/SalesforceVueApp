<script>
export default {
    props: {
        quoteLineItems: Array
    }
}

</script>
<template>
    <div>
        <h5>Quotes Line Item</h5>
        <div class="slds-card">
            <div class="slds-card__body">
                <ul class="slds-list_dotted">
                    <li v-for="qli in quoteLineItems" :key="qli.Id">
                        <div class="slds-box slds-theme_default slds-m-bottom_small">
                            <p>{{ qli.Product2.Name }}: {{ qli.Quantity }} @ {{ qli.Subtotal }}</p>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</template>


