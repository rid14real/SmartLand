// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import './node_modules/openzeppelin-solidity/contracts/token/ERC721/ERC721.sol';

/**
 * @ Follow the list of variables and functions needed in my view to create our functions smart contract for handle
 * with land property;
 * @ NOTE that the functions are not implemented here, only for organize and clarify the variables and functions
 * need.
 */

/** Inherit ERC721, thus its functions must be implemented as well;
 * Later on we better merge all content in a single contract and cut off the functions inherited from ERC721 which
 * will not serve for our project.
 */
contract SmartLandTest is ERC721 {

    // emited when the contract owner register an user.
    event Register(address _userAddress, uint256 _registryNo, uint256 _id, string _name);
    // emited when the contract owner mint a title nft.
    event CreateTitle(address _sender, address _receiver, uint256 titleId);
    // emited for every transfer of ownership.
    // (ERC721 andready got this function, need to merge)
    event Transfer(address _from, address _to, uint256 titleid);

    // a registered user number counter, each one is unique and should be generated automatically using Counters library.
    uint256 registryCounter;
    // the title ID number, each one is unique and should be generated automatically using Counters library.
    uint256 titleId;
    // the owner of the contract, asserted during deploying, could be changed if contract owner wish.
    address contractOwner;

    // struct variable to carry the nft title infos. each TitleInfo is mapped to an unique titleId.
    struct TitleInfo {
        // physical address, street, number, district, city, region, country, postal code, etc.
        string titleAddress;
        // gps coordinates of the land.
        string titleCoordinates;
    }

    // struct variable carrying the registered users info. each UserInfo is mapped to an unique address
    struct UserInfo {
        // a registered user number, each one is unique and should be generated automatically using Counters library. 
        uint256 registryNo;
        // user's ID.
        uint256 id;
        // user's full name
        string name;
    }
    
    // shows the amount of titles a given address holds.
    mapping(address => uint256) _balanceOf;
    // point the user owner of an given titleId.
    mapping(uint256 => address) _ownerOf;
    // points to the struct TitleInfo of a given titleId.
    mapping(uint256 => TitleInfo) _titleInfo;
    // returns true if the titleId exists;
    mapping(uint256 => bool) _titleExists;
    // points to the struct UserInfo of a given address registered.
    mapping(address => UserInfo) userInfo;
    // returns true if the address was already registered.
    mapping(address => bool) userExists;

    /*
     * @("SmartLand Token", "LAND") corresponds to the ERC721/IERC721Metedata.sol interface, name and symbol;
     * @ some state variables should be initialized on the constructor.
     */
    constructor () ERC721 ("SmartLand Token", "LAND") {
        titleId = 0;
        registryCounter = 0;
        contractOwner = msg.sender;
    }

    // modifier restricts function use for only contract owner.
    modifier onlyOwner() {require(msg.sender == contractOwner, "Not contract owner"); _;}
    
    /**
     * @ to create nft titles (the process of creation is handled between user and registry office).
     * 
     * @ input parameters are the user registered address and the struct TitleInfo;
     * @ should be required "userExists[_address] = true" to proceed with the creation;
     * @ titleId will point to TitleInfo inputs.
     * @ use function _mint inherited from ERC721.sol / emit event (check which one);
     * @return the generated titleId;
     */
    function mint(address _receiver, string memory titleAddress, string memory titleCoordinates) public onlyOwner returns (uint256 titleId) {}

    /**
     * @ to transfer nft titles between registered users.
     * 
     * @ should be required "userExists[_address] = true" from both users to proceed with the transfer;
     * @emit event Transfer (inherited from ERC721.sol);
     * @return true if the transaction succeed;
     */
    function transfer(address _from, address _to, uint256 _titleId) public onlyOwner returns (bool success) {}
    
    /**
     * @ Getter function - find TitleInfo struct related to titleId provided.
     * 
     * @return the TitleInfo struct titleAddress and titleCoordinates;
     */
    function getTitleInfo(uint256 _titleId) public view returns ( string memory, string memory) {}
    
    /**
    * @ getter function - find the owner of a given titleID.
    *
    * @return the user owner address.
    */
    function ownerOf(uint256 _titleId) public view onlyOwner override returns (address) {}
    
    /**
     * @ getter function - show the amount of nft titles an address holds.
     *
     * @ this function is used by the bscscan explorer to show amount of titles an address have;
     * @return the balance/amount of titles.
     */
    function balanceOf(address _address) public view override returns (uint256 balance) {}
    
    /**
     * @ getter function - show the total amount of nft titles already created.
     *
     * @ this function is used by the bscscan explorer to show total amount of titles a contract have;
     * @return total amount of titles contract generated.
     */
    function totalSuply() public view returns (uint256 balance) {}
    
    /**
     * @ set and change new address for contract owner. 
     *
     * @return true if the change was successful.
     */
    function setContractOwner(address _newOwner) public onlyOwner returns (bool success) {}

    /*
     * @ register an user address and point the UserInfo data using mapping from address to UserInfo.
     * 
     * @ NOTE that the request and data should be provided by the user on the registry office;
     * @return true if the user is successfully registered.
     */
    function registerUser(address _address, uint256 _id, string memory _name) public onlyOwner returns (bool success) {}

    /**
     * @getter function - get the UserInfo mapped from a given address to UserInfo data.
     *
     * @return the UserInfo data.
     */
    function getUserInfo(address _address) public view returns (uint256, uint256, string memory) {}
    
    /**
     * @ those functions could be worked in order to improve the contract capabilities,
     * however they may be dificult to implement at the moment.
     * If the team has time enough, it could work out, if not they could be discarded for now.
     */
    //function mergeTitle(address _to, uint256 _tokenId, string structInfos) public onlyOwner returns (uint256) {}
    //function generateProofOfOwnership(address _address, uint256 titleId) public onlyOwner returns(uint256, string structInfos) {}
    //function tokenOwnerList() public returns (address userOwner) {}

}  