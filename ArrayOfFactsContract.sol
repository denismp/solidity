pragma solidity >=0.4.22 <0.6.0;
pragma experimental ABIEncoderV2; // This is experimental.  don't use in main net.
// https://blog.ethereum.org/2019/03/26/solidity-optimizer-and-abiencoderv2-bug/

contract ArrayOfFactsContract {
    string[] private facts;
    address private owner;

    constructor() public {
        owner = msg.sender;
    }

    function add(string memory fact) public {
        require(msg.sender == owner, "Only the owner can invoke this funtion");
        facts.push(fact);
    }

    function count() public view returns(uint) {
        return facts.length;
    }

    function get(uint index) public view returns(string memory) {
        require(index < facts.length, "index is out of range");
        return facts[index];
    }

    function getOwner() public view returns(address) {
        return owner;
    }

    // This functions needs the ABIEncoderV2 to return the string[]
    function getFacts() public view returns(string[] memory) {
        return facts;
    }
}