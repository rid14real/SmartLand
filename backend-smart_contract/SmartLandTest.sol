// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import 'openzeppelin-solidity/contracts/token/ERC721/ERC721.sol';

/*
ALREADY DONE:
described all functions needed for the project to work, check need of all functions and if lacks more;

TODO: 
set all state variables needed, as well as mapping functions;
check requirements in all functions, if all proceed;
set the approval functions for the users to request and allow contract owner to transer, merge, and request proof;
check the imported contracts and its functions, replace or use all of then, also delete the unnecessary;
*/

contract SmartLandTest is ERC721 {

    // state variables here
    address owner;
    uint256 tokenId;
    uint256[] tokenIds;
    address[] users;

    struct TittleInfo {
        string tittleAddress;
        //TODO
    }

    // events here

    // mapping variables here
    mapping(address => uint256) _balanceOf;
    mapping(uint256 => address) _ownerOf;

    // constructor here;
    constructor () ERC721 ("SmartLand Token", "LAND") {
        tokenId = 0;
        owner = msg.sender;
    }

    // modifiers here
    modifier onlyOwner() {
        require(msg.sender == owner);
    }

    // functions here
    function mint(address _to, structdata) public onlyOwner returns (uint256) {
        require(isRegistered(_to), "User receiver not registered");
        //TODO
    }

    function transfer(address _from, address _to, uint256 tokenId) public onlyOwner returns (bool success) {
        require(isRegistered(_from), "User sender not registered");
        require(isRegistered(_to), "User receiver not registered");
        //TODO
    }

    // check code
    function registerUser(address _address) public onlyOwner returns (bool success) {
            if(!isRegistered(_address)) {
                users.push(_address);
                return true;
            }
            return false;
    }

    // check code
    function isRegistered(address _address) internal returns (bool) {
        if(users.contains(_address)) {
            return true;
        }else {
            return false;
        }
    }

    // high complexity function, a tittle cannot be burnt without a new one is created over it,
    // and several tittles could be burnt to merge into a single tittle, address requested should be
    // owner of all tittles and will obligatory receive the merged one. 
    function mergeTittle(address _to, uint256 _tokenId, struct) public onlyOwner returns (uint256) {
        require(isRegistered(_to), "User receiver not registered");
        require(isOwner(_to, _tokenId), "User is not tittle owner");
        _burn(_tokenId); // burn the old nft, but the tokenId will not be used anymore.
        _mint(_tokenId); // mint a new one merging previous tittles, with a new tokenId generated.
        // TODO
    }

    function generateProofOfOwnership(address _address, uint256 tokenId) public onlyOwner returns(uint256, struct) {
        require(isRegistered(_address), "User not registered");
        require(isOwner(_address, _tokenId), "User is not tittle owner");
        // TODO
    }

    // check the code, if lacks something.
    function ownerOf(uint256 _tokenId) public onlyOwner returns (address) {
        return _ownerOf[_tokenId];
        //TODO
    }

    // check codes as well
    function isOwner(address _address, uint256, _tokenId) internal returns (bool) {
        if(_ownerOf[_tokenId] == _address) {
            return true;
        }
        return false;
    }

    // check codes
    function balanceOf(address _address) public returns (uint256 balance) {
        require(isregistered(_address), "User not registered");
        return _balanceOf[_address];
    }

    // check code
    function totalSuply() public returns (uint256) {
        return tokenIds.lenght;
    }

    // find out how to return a list of all tokenIds and respective addresses iterated in one function
    function tokenOwnerList() public returns (uint256, address) {
        for(uint i = 0; i >= tokenIds.lenght; i++) {
            return (tokenIds[i], _ownerOf[tokenIds[i]]);
        }
    // TODO
    }

    function tokenInfo(address _address, uint256 _tokenId) public OnlyOwner returns (struct) {
        require(isRegistered(_address), "User not registered");
        require(isOwner(_address, _tokenId), "User is not tittle owner");
        // TODO
    } 

    function setOwner(address _newOwner) public onlyOwner returns (bool success) {
        owner = _newOwner;
        return true;
    }

    // more functions here...

}    
