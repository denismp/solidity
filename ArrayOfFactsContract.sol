pragma solidity >=0.4.22 <0.6.0;

contract ArrayOfFactsContract {
    string[] facts;

    function add(string memory fact) public {
        facts.push(fact);
    }

    function count() public view returns(uint) {
        return facts.length;
    }

    function get(uint index) public view returns(string memory) {
        return facts[index];
    }
}