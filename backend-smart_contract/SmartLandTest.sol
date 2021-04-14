import 'openzeppelin-solidity/contracts/token/ERC721/ERC721.sol';
import 'openzeppelin-solidity/contracts/access/Ownable.sol';

contract SmartLandTest is ERC721, Ownable {

    // events here
    event NewTitle(uint tokenId, address user, string name);

    // state variables here
    string name;
    string symbol;
    address owner;
    uint256 tokenId;

    struct Title {
        string name;
        string titleAddress;
        //TODO
    }

    // An organised storage for new titles and users data
    Title[] public titles;
    User[] public users; // this array is here tentatively


    // Mapping to keep track of the address that owns a title
    mapping (uint => address) titleToOwner;

    // mapping variables here
    mapping(address => uint256) _balanceOf;
    mapping(uint256 => address) _ownerOf;

    // constructor here;
    constructor () ERC721 ("SmartLand Token", "LAND") {
        tokenId = 0;
        owner = msg.sender;
    }

    // modifiers here
    // this modifier will be added to validate the ownership of the title by the owner
    modifier ownerOf(uint _titleId) {
        require(msg.sender == titleToOwner[_titleId]);
        _;
    }

    // function to create title
    function _createTitle(string memory _name, uint _titleAddress) private onlyOwner {
        uint. id = titles.push(Title(_name, _titleAddress)) - 1;
        titleToOwner[id] = msg.sender;
        emit NewTitle(uint titleId, string name, uint titleAddress)
    }

    // this function should return the land title or profile that belongs to a particular user
    // anyone can call it in order to verify the authenticity of the ownership
    // this function will not cost the user calling it any gas
    function getTitleByOwner(address _owner) external view returns(uint[] memory) {
        uint[] memory result = new uint[](titleToOwner[_owner]);
        return result;
    }

    // the above function setting is for creating NFTs for each title in the Land registry.
    // the functions below are for the potential users to interact with afterwards

    // functions here
    function mint(address _to, structdata) public onlyOwner returns (uint256) {
        uint id = titles.push(Title(_to, structdata))
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
    // high complexity function, a title cannot be burnt without a new one created over it,
    // and several titles could be burnt to merge into a single title, address requested should be
    // owner of all titles and will obligatory receive the merged one. 
    function mergeTitle(address _to, uint256 _tokenId, struct) public onlyOwner returns (uint256) {
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
        return tokenIds.length;
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