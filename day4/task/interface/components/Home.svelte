<script>
  import logo from ".././assets/camp_logo.png"
  import ConnectButton from ".././components/shared/ConnectButton.svelte"
</script>

<div>
  <header class="App-header">
    <img src={logo} class="App-logo" alt="logo" />
    <p class="slogan">Motoko Bootcamp Dao</p>
    <p class="twitter">← Open me!</p>
    <ConnectButton />
  </header>
</div>
