<script>
  import { principal, ledgerActor } from "../../stores"
  import { plugConnection } from "../connexion"
  import { get } from "svelte/store"
    import { Principal } from "@dfinity/principal"

  export let message = "Sign in"


  async function getBalance() {
    
    if (!principal) {
      return 
    }
    let ledger = get(ledgerActor)
    if (!ledger) {
      return 
    }
    let res = await ledger.icrc1_balance_of({
      owner : get(principal),
      subaccount : []
    })
    console.log(res)
    return res;
  }

  async function getTransactions() {
    if (!principal) {
      return 
    }
    let ledger = get(ledgerActor)
    if (!ledger) {
      return 
    }
    let res = await ledger.get_transactions({
      length: 200,
      start: 0
    })
    console.log(res.first_index)
    console.log(res.log_length)
    console.log(res.transactions)
    for (const x of res.transactions) {
        
        var dateFormat = new Date(Number(BigInt(x.timestamp) / BigInt(1000000)));
        if (x.kind === 'TRANSFER') {
          console.log(x.index)
          console.log(x)
          console.log(x.kind)
          console.log(x.transfer[0].amount)
          console.log(x.transfer[0].from.owner.toString())
          console.log(x.transfer[0].to.owner.toString())
          console.log(dateFormat)
        }

        if (x.kind === 'MINT') {
          console.log(x.index)
          console.log(x)
          console.log(x.kind)
          console.log(x.mint[0].amount)
          console.log(x.mint[0].to.owner.toString())
          console.log(dateFormat)
        }
    }
    return res;
  }
</script>

{#if $principal}
    {#await getBalance()}
    <h1 class="slogan">Loading...</h1>
    {:then res}
    <p style="color: white">
      Login successfully! Current balances: {res}
    </p>
    <p style="color: white">
      transactions: {getTransactions()}
    </p>
    {:catch error}
      <p style="color: red">{error.message}</p>
    {/await}
{:else}
  <button on:click={() => plugConnection()}> {message} </button>
{/if}

