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

contract UserRegister {

    // event emited when an user is added;
    // this event should be reviewed, maybe change the event name.
    event UserRegistered(address _userAddress, uint256 _registryNo, uint256 _id, string _name);

    // generated registry number, for each user registered using registerUser function, it's incremented by 1
    // should be initialized on constructor equals 0; 
    uint256 registryCounter;

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

    // inside the constructor function as demonstration, the registryCounter should be initialyzed as 0:
    constructor () {
        registryCounter = 0;
    }

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
        UserInfo memory infos = UserInfo(_address, registryCounter, _id, _name);
        userInfo[_address] = infos;
        emit UserRegistered(_address, registryCounter, _id, _name); // event should be reviewed
        registryCounter++;
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

    // more functions to be implemented?

}