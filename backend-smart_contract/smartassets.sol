pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

//We want this assets to be verifiable as much as we want ownership to be verifiable.
//to enable that we are Defining variables in our contract that we’ll use to help control the above point.
//We are using Counters to help us increment the identifiers for the tokens we mint.
//this _tokenIds variable helps to keep track of all of the tokens we’ve issued.
//we’re creating a mapping for the IPFS hashes associated with tokens. 
//This will help prevent issuing tokens mapped to a hash previously associated with another token.

contract MyAssetLand is ERC721 {

using Counters for Counters.Counter;
Counters.Counter private _tokenIds;

mapping(string => uint8) hashes;


  constructor() public ERC721("MyAssetLand", "LAND"); {
}

//We will add a method to our contract that will allow us to mint an NFT for a specific IPFS hash if not token has been minted yet for that hash.
//Our function takes two parameters: An address variable called recipient. 
//A string variable called hash, and a string variable called metadata.
//
//
//The address variable is the person’s wallet address who will receive the NFT. 
//The string variable for the hash is the IPFS hash associated with the content we are creating the NFT for. 
//The string variable for metadatashould refer to a link to the JSON metadata for the asset.
//Inside the function, we used Solidity’s built-in require to automatically reject the contract call if the hash has been used to mint an NFT before.
//We have also check if our hashes mapping has a matching hash with the integer of 1. 
//If so that hash has been used.
//If the hash has not been used, we add the hash passed through our function to our hashes mapping and set its value to 1.
//We increment our _tokenIds variable because we’re about to create a new NFT and we mint our token, returning the token identifier.
//

function awardItem(address recipient, string memory hash, string memory metadata) public returns (uint256); {

  require(hashes[hash] != 1);
  hashes[hash] = 1;

  _tokenIds.increment();

  uint256 newItemId = _tokenIds.current();
  _mint(recipient, newItemId);
  _setTokenURI(newItemId, metadata);
  
  //The setTokenURI is use to store an item metadata
  
  return newItemId;

}
