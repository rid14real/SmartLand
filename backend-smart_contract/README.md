Backend code for SmartLand project

NOTE: some additional content belongs to two libraries installed to enhance contract creation, being openzeppelin-solidity and truffle suite, installed through npm on node.js

    npm intall truffle -g
    npm intall openzeppelin-solidity

The folder "node_modules" and files "package-lock.json", "package.json" belongs to openzeppelin library and dependencies;

The folders "migrations", "contracts", "test", and the file "truffle-config.js" belongs to truffle library and dependencies;

File content description:

 - "model.sol" - description of all variables and functions the contract should have to be functional (commited by Jay);


Aiming enhanced organization, I've decided to divide the contract by fractions, this way will be easier to understand the contract:
 - "UserRegister.sol" - all variables and functions related to user registration for the main contract. could be created an library for them to be inherited on the final contract for example, or directly implemented by copy/paste (commited by Jay);
 - "TitleData.sol" - all variable and functions related to nft creation/minting and transfering (commited by Jay);

 -"2-deploy-contract.js", "migration.sol", "smartassets.sol" - should be implemented accordingly on the final contract version(commited by Esther);

 - "SmartLandTest.sol", "flattenedSmartland.sol", "smartland.sol" - first contract deployment version, DEPRECATED, should be deleted on the final repo commit.

 

