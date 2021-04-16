window.addEventListener('load', function() {

    // Checking if Web3 has been injected by the browser (Mist/MetaMask)
    if (typeof web3 !== 'undefined') {
        // Use Mist/MetaMask's provider;
        web3js = new Web3(web3.currentProvider);
    } else {
        // Handle the case where the user doesn't have web3. Probably
        // show them a message telling them to install Metamask in 
        // order to use our app.
    }

    // Now you can start your app & access web3js freely:
    startApp()
})