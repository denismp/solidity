pragma solidity >=0.4.22 <0.6.0;

contract ArrayContract {
    uint[] values;

    function arrPlayground() public pure returns(uint8[5] memory) {
        uint8[5] memory arr = [1,2,3,4,5];

        return arr;
    }

    function add(uint value) public {
        values.push(value);
    }

    function get() public view returns(uint[] memory) {
        return values;
    }

    function length() public view returns(uint) {
        return values.length;
    }
}