pragma solidity >=0.4.22 <0.6.0;

contract SimpleStorage {
    uint  data;

    function set(uint value) public {
        data = value;
    }

    function get() public view returns(uint){
        return data;
    }
}