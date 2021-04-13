Backend code for SmartLand project

Temporary infos:

The last commit brought openzeppelin-solidity libraries addition as well as some truffle files for all contributors to enjoy using those tools, as the open zeppelin libraries, some truffle commands as truffle-flattener to merge all dependencies of a written smart-contract into one single file.

the edited smart-contract is smartland.sol, which inherits ERC721.sol contract from open zeppelin library.

the flattenedSmartland.sol is the merged file with all dependencies included. (read that, all imports and interfaces nedded)

Folders:
migration, contracts, test belongs to truffle suite;

node_modules belongs to openzeppelin library dependencies;

package.json and package-lock.json also belongs to openzeppelin libraries.
