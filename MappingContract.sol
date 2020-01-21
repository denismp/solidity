pragma solidity >=0.4.22 <0.6.0;

contract MappingContract {
    mapping(string => address) namesMap;

    function set(string memory key) public {
        namesMap[key] = msg.sender;
    }

    function get(string memory key) public view returns(address) {
        return namesMap[key];
    }
}