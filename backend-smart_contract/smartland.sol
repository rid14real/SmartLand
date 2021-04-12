// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import 'openzeppelin-solidity/contracts/token/ERC721/ERC721.sol';

contract SMARTLANDsample is ERC721 {

    uint256 tokenId;
    uint256[] tokenIds;

    struct TittleInfo {
        uint256 tittlenumber;
        string tittleaddress;
        string tittlecoordinates;
    }

    mapping(uint256 => TittleInfo) public _tittleInfos;
    mapping (uint256 => address) public _owners;

    constructor () ERC721 ("SmartLand Token", "LAND") {
        tokenId = 202104070000;
    }

    function createTittle(
        address _to,
        uint256 _tittlenumber,
        string memory _tittleaddress,
        string memory _tittlecoordinates
        )public returns(uint256 _tokenId) {
        TittleInfo memory infos = TittleInfo(_tittlenumber, _tittleaddress, _tittlecoordinates);
        _tittleInfos[tokenId] = infos;
        _mint(_to, tokenId);
        tokenIds.push(tokenId);
        tokenId++;
        return tokenId - 1;
    }

    // get the total number of tokens minted
    function totalSupply() public view returns (uint256) {
        return tokenIds.length;
    }   

    // get the info struct of a given tokenId
    function getTittleInfo(uint256 _tokenId) public view returns (uint256, string memory, string memory) {
        TittleInfo memory infos = _tittleInfos[_tokenId];
        return (infos.tittlenumber, infos.tittleaddress, infos.tittlecoordinates);
    }

/*
those are not yet functional at all, should make some improvements, find errors, etc.
    // get the owner of a given tokenId
    function getTokenOwner(uint256 _tokenId) public view returns(uint256, address) {
            return (_tokenId, _owners[_tokenId]);
    } 
    // get a list of all tokenIds mapped to their owners
    function getTokenOwnerList() public view {
        for(uint i = 0; i > tokenIds.length; i++) {
            getTokenOwner(tokenIds[0]);
        }
    }
*/

}