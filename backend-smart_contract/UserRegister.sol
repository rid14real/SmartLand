// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/*
* For an additional security step, all addresses could pass through a
* registering process prior to be allowed to receive or transfer a title NFT;
*
* ONLY REGISTERED USERS CAN RECEIVE OR HOLD TITLES;
*
* The registry proccess will ensure identification of all addresses throught the infos provided, also
* will serve as a require parameter for transfer and receive title NFTs;
*
* The following variables/mappings/modifiers/functions could be implemented to the contract in order to achieve 
* this security standard.
*/
import "./node_modules/openzeppelin-solidity/contracts/utils/Counters.sol";

contract UserRegister {
    using Counters for Counters.Counter;

    // event emited when an user is added;
    // this event should be reviewed, maybe change the event name.
    event UserRegistered(address _userAddress, uint256 _registryNo, uint256 _id, string _name);

    // auto-generate registry numbers for the users registered, by default, registryNumber initializes = 0.
    Counters.Counter private registryNumber;

    // struct class to store user infos, note that the registryNo is automatically generated.
    struct UserInfo {
        // User's address.
        address userAddress;
        // auto-generated registry number (starts in 0, each user added increments +1).
        uint256 registryNo;
        // user's ID.
        uint256 id;
        // user's full name.
        string name;
    }

    // tracks the user infos for each registered address.
    mapping(address => UserInfo) userInfo;
    
    // return true if user has already registered on the system.
    mapping(address => bool) userExists;

    // no need to initialize Counters.Counter on constructor anymore.
    constructor () {}
    /*
     * @ for register new users on the system and allow then to hold/send/receive title NFTs as a security step;
     * @ the user address, ID and full name should be inserted on the function, the registryNumber
     * is generated automatically through registryCounter, starting by 0 and sum +1 for each user added;
     * @ addresses registered are mapped with userExists and return true if user address exists;
     * @ user infos are stored on a struct UserInfo and mapped with userInfo;
     * @ only the contract owner can register a new user (onlyOwner modifier needed);
     * @ return true if user is successfuly registered;
     * @ require userExists[address] = false.
     */
    function registerUser(address _address, uint256 _id, string memory _name) 
            public returns (bool success) { //should add the keywork onlyOwner
        require(!(userExists[_address]), "User already registered"); // requires UserExists[_address] == false.
        userExists[_address] = true;
        uint256 _registryNo = registryNumber.current();
        UserInfo memory infos = UserInfo(_address, _registryNo, _id, _name);
        userInfo[_address] = infos;
        emit UserRegistered(_address, _registryNo, _id, _name); // event should be reviewed
        registryNumber.increment();
        return true; 
    }

    /*
     * @ getter function for UserInfo search by user address;
     * @ other getter functions could be created by other struct variables, since a mapping to struct data
     * is generated. 
     */
    function getUserInfo(address _address) public view returns (address, uint256, uint256, string memory) {
        require(userExists[_address], "User not registered");
        UserInfo memory infos = userInfo[_address];
        return (infos.userAddress, infos.registryNo, infos.id, infos.name);
    }

    /* 
     * ADDITIONAL NOTES:
     * the Function getUserInfo can be overloaded, in order to generate enhanced search parameters as follow below:
     */
    // mapping variables to track struct UserInfo:
    mapping(uint256 => UserInfo) userInfoByRegistryNo;
    mapping(uint256 => UserInfo) userInfoById;
    mapping(string => UserInfo) userInfoByName;
    // mapping variables to check is user exists is not mandatory, however:
    mapping(uint256 => bool) userInfoByRegistryNoExists;
    mapping(uint256 => bool) userInfoByIdExists;
    mapping(string => bool) userInfoByNameExists;
    //then implement the respective getter functions:
    function getUserInfoByRegistryNo(uint256 _registryNo) public view returns (address, uint256, uint256, string memory) {
        require(userInfoByRegistryNoExists[_registryNo], "User not registered");
        UserInfo memory infos = userInfoByRegistryNo[_registryNo];
        return (infos.userAddress, infos.registryNo, infos.id, infos.name);
    }
    function getUserInfoById(uint256 _Id) public view returns (address, uint256, uint256, string memory) {
        require(userInfoByIdExists[_Id], "User not registered");
        UserInfo memory infos = userInfoById[_Id];
        return (infos.userAddress, infos.registryNo, infos.id, infos.name);
    }
    function getUserInfoByName(string memory _name) public view returns (address, uint256, uint256, string memory) {
        require(userInfoByNameExists[_name], "User not registered");
        UserInfo memory infos = userInfoByName[_name];
        return (infos.userAddress, infos.registryNo, infos.id, infos.name);
    }
}