import "web3.min.js";
import "../javascript/metamask-checker.js";
import "../javascript/smartland_abi.js";


// This part lets the user interface talk to the smart contract
    // Insert the smartland deployment address where the string "SMARTLAND_CONTRACT_ADDRESS" is.
    var smartLand;

    var userAccount;

    function startApp() {
      var smartLandAddress = "SMARTLAND_CONTRACT_ADDRESS";
      // The smartLandABI has been initialised in its file
      smartLand = new web3js.eth.Contract(smartLandABI, smartLandAddress);

      // Creating setInterval to check if the userAccount has changed so as to change the details on the UI
      var accountInterval = setInterval(function() {
        // Check if account has changed
        if (web3.eth.account[0] !== userAccount) {
          userAccount = web3.eth.account[0];
          // Call some functions to update the UI with the new account
          getTitleByOwner(userAccount);
          .then(displayTitle);
        }
      }, 100) // This function checks the above condition every 100 miliseconds
    }

    function displayTitle(id) {
      $("#title").empty(); // Remove the details of any title in the div to update it below
      // Look up title details from the smartland contract. Returns a `title` object
      getTitleDetails(id)
      .then(function(title) {
        // Using ES6's "template literals" to inject variables into the HTML.
        // Appending each one to the #title div
        $("#title").append(`<div class="title">
          <ul>
            <li>Name: ${title.name}</li>
            <li>Address: ${title.titleAddress}</li>
          </ul>
        </div>`);
      }); 
    }

    function getTitleDetails(id) {
      return smartLand.methods.titles(id).call() // The titles(id) is a function with parameter (could be an array or struct)
    }

    function titleToOwner(id) {
      return smartLand.methods.titleToOwner(id).call()
    }

    function getTitleByOwner(owner) {
      return smartLand.methods.getTitleByOwner(owner).call()
    }

    // This is the metamask checker
    window.addEventListener('load', function() {

      // Checking if Web3 has been injected by the browser (Mist/MetaMask)
      if (typeof web3 !== 'undefined') {
          // Use Mist/MetaMask's provider;
          web3js = new Web3(web3.currentProvider);
      } else {
          // Handle the case where the user doesn't have web3. Probably
          // show them a message telling them to install Metamask in 
          // order to use our app.
          web3 = new Web3(new Web3.providers.HttpProvider("MetaMask"));
      }

      // Now you can start your app & access web3js freely:
      startApp()
      })
      