pragma solidity >=0.4.22 <0.6.0;

contract CertificateREgistryContract {
    mapping(uint => bool) certificates;
    address owner;

    constructor() public {
        owner = msg.sender;
    }

    function add(uint hash) public {
       require(msg.sender == owner, "Only the contract owner can invoke this function.");
       certificates[hash] = true;
    }

    function get(uint hash) public view returns(bool) {
        return certificates[hash];
    }
}